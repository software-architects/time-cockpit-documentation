// time cockpit customizations for the docfx "modern" template.
// Options reference: https://dotnet.github.io/docfx/docs/template.html

export default {
  defaultTheme: 'auto',
  // Lightbox: the template default (images larger than 200px that are not already links) is right.
  start: () => {
    // The modern template renders ```mermaid blocks into <pre class="mermaid"> and
    // re-renders them on theme changes. This adds a zoom toolbar and drag-to-pan
    // around each diagram and keeps the zoom level across re-renders.
    const minZoom = 0.5;
    const maxZoom = 3;
    const zoomStep = 0.25;
    const clamp = (z) => Math.min(maxZoom, Math.max(minZoom, z));

    const applyZoom = (figure, zoom) => {
      const z = clamp(zoom);
      figure.dataset.zoom = z.toFixed(2);
      const svg = figure.querySelector('pre.mermaid svg');
      const viewport = figure.querySelector('.mermaid-viewport');
      if (svg && viewport) {
        // Pixel widths: a percentage would resolve against the <pre>, not the viewport.
        svg.style.width = z === 1 ? '100%' : `${Math.round(viewport.clientWidth * z)}px`;
        svg.style.maxWidth = 'none';
        svg.style.height = 'auto';
      }
      const label = figure.querySelector('.mermaid-zoom-level');
      if (label) label.textContent = `${Math.round(z * 100)}%`;
    };

    const attachPan = (viewport) => {
      let pointerId = null, startX = 0, startY = 0, startLeft = 0, startTop = 0;
      const end = () => { pointerId = null; viewport.classList.remove('is-dragging'); };
      viewport.addEventListener('pointerdown', (e) => {
        if (e.button !== 0) return;
        pointerId = e.pointerId;
        startX = e.clientX; startY = e.clientY;
        startLeft = viewport.scrollLeft; startTop = viewport.scrollTop;
        viewport.classList.add('is-dragging');
        viewport.setPointerCapture(e.pointerId);
        e.preventDefault();
      });
      viewport.addEventListener('pointermove', (e) => {
        if (pointerId !== e.pointerId) return;
        viewport.scrollLeft = startLeft - (e.clientX - startX);
        viewport.scrollTop = startTop - (e.clientY - startY);
        e.preventDefault();
      });
      viewport.addEventListener('pointerup', (e) => {
        if (pointerId === e.pointerId) { viewport.releasePointerCapture(e.pointerId); end(); }
      });
      viewport.addEventListener('pointercancel', end);
      viewport.addEventListener('lostpointercapture', end);
      viewport.addEventListener('dragstart', (e) => e.preventDefault());
    };

    const wrap = (pre) => {
      if (pre.closest('.mermaid-figure')) return;
      const figure = document.createElement('figure');
      figure.className = 'mermaid-figure';
      figure.dataset.zoom = '1';

      const toolbar = document.createElement('div');
      toolbar.className = 'mermaid-toolbar';
      toolbar.innerHTML =
        '<button type="button" class="btn btn-sm btn-outline-secondary" data-mermaid-zoom="out" aria-label="Zoom out">-</button>' +
        '<span class="mermaid-zoom-level" aria-live="polite">100%</span>' +
        '<button type="button" class="btn btn-sm btn-outline-secondary" data-mermaid-zoom="in" aria-label="Zoom in">+</button>' +
        '<button type="button" class="btn btn-sm btn-outline-secondary" data-mermaid-zoom="reset" aria-label="Reset zoom">Reset</button>';
      toolbar.addEventListener('click', (e) => {
        const button = e.target.closest('[data-mermaid-zoom]');
        if (!button) return;
        const current = Number.parseFloat(figure.dataset.zoom || '1');
        const action = button.dataset.mermaidZoom;
        applyZoom(figure, action === 'in' ? current + zoomStep : action === 'out' ? current - zoomStep : 1);
      });

      const viewport = document.createElement('div');
      viewport.className = 'mermaid-viewport';
      attachPan(viewport);

      pre.replaceWith(figure);
      viewport.appendChild(pre);
      figure.append(toolbar, viewport);

      // Re-apply the zoom whenever the template swaps the SVG (theme change).
      new MutationObserver(() => applyZoom(figure, Number.parseFloat(figure.dataset.zoom || '1')))
        .observe(pre, { childList: true });
      applyZoom(figure, 1);
    };

    const wrapAll = () => document.querySelectorAll('article pre.mermaid').forEach(wrap);

    // The navbar is rendered from toc.yml without honoring "target", so open
    // external navbar entries (e.g. the website link) in a new tab.
    const externalNavLinks = () => {
      document.querySelectorAll('#navbar a[href^="http"]').forEach((a) => {
        if (a.hostname !== location.hostname && a.target !== '_blank') {
          a.target = '_blank';
          a.rel = 'noopener';
        }
      });
    };

    // Consent-gated videos. Markup in Markdown:
    //   <div class="tc-video" data-youtube="ID" data-title="..." data-poster="images/x.jpg"></div>
    //   <div class="tc-video" data-vimeo="ID" ...></div>
    // Until "External Media" consent (window.cookieConsent.externalmedia, set by the
    // Silktide config in _master.tmpl) only a local poster/placeholder is shown; the
    // iframe is created on consent and removed again when consent is withdrawn.
    const embedUrl = (el, autoplay) => {
      if (el.dataset.youtube) {
        return `https://www.youtube-nocookie.com/embed/${el.dataset.youtube}?rel=0${autoplay ? '&autoplay=1' : ''}`;
      }
      if (el.dataset.vimeo) {
        return `https://player.vimeo.com/video/${el.dataset.vimeo}?dnt=1&badge=0${autoplay ? '&autoplay=1' : ''}`;
      }
      return null;
    };

    const renderVideos = () => {
      const granted = !!(window.cookieConsent && window.cookieConsent.externalmedia);
      document.querySelectorAll('.tc-video[data-youtube], .tc-video[data-vimeo]').forEach((el) => {
        const title = el.dataset.title || 'Video';
        if (granted) {
          if (el.querySelector('iframe')) return;
          const autoplay = el.hasAttribute('data-autoplay');
          el.removeAttribute('data-autoplay');
          el.innerHTML = '';
          const iframe = document.createElement('iframe');
          iframe.src = embedUrl(el, autoplay);
          iframe.title = title;
          iframe.loading = 'lazy';
          iframe.allow = 'autoplay; fullscreen; picture-in-picture';
          iframe.allowFullscreen = true;
          iframe.referrerPolicy = 'strict-origin-when-cross-origin';
          el.appendChild(iframe);
        } else {
          if (el.querySelector('.tc-video-gate')) return;
          el.innerHTML = '';
          const gate = document.createElement('a');
          gate.className = 'tc-video-gate';
          gate.href = '#';
          gate.title = 'Please accept cookies to display the video.';
          if (el.dataset.poster) {
            const img = document.createElement('img');
            img.src = el.dataset.poster;
            img.alt = `Video: ${title}`;
            img.loading = 'lazy';
            gate.appendChild(img);
          }
          const play = document.createElement('span');
          play.className = 'tc-video-play';
          play.setAttribute('aria-hidden', 'true');
          play.innerHTML = '<i class="bi bi-play-fill"></i>';
          const hint = document.createElement('span');
          hint.className = 'tc-video-hint';
          hint.textContent = 'Please accept cookies to display the video.';
          gate.append(play, hint);
          gate.addEventListener('click', (e) => {
            e.preventDefault();
            el.setAttribute('data-autoplay', '');
            if (typeof window.renewCookieConsent === 'function') window.renewCookieConsent();
          });
          el.appendChild(gate);
        }
      });
    };
    window.addEventListener('cookieConsentChanged', renderVideos);

    const update = () => { wrapAll(); externalNavLinks(); renderVideos(); };
    update();
    new MutationObserver(update).observe(document.body, { childList: true, subtree: true });
  }
}
