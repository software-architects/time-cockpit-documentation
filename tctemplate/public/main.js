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

    const update = () => { wrapAll(); externalNavLinks(); };
    update();
    new MutationObserver(update).observe(document.body, { childList: true, subtree: true });
  }
}
