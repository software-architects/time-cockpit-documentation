templates/modern is a verbatim copy of the docfx 2.78.2 "modern" template
(source maps removed). Do not edit it.

Why it is vendored: the build pipeline (TimeCockpit.Documentation-CI) uses an
old docfx that does not ship the modern template, so docfx.json references this
folder by path instead of the template name.

To upgrade: copy templates/modern from a newer docfx installation
(<dotnet tools>/.store/docfx/<version>/docfx/<version>/templates/modern), delete
*.map files, copy the default template's token.json to tctemplate/token.json,
then re-diff tctemplate/layout/_master.tmpl against templates/modern/layout/_master.tmpl.

tctemplate additionally carries toc.json.js, toc.json.tmpl and toc.extension.js
(copies from the docfx 2.78.2 default template): the modern JavaScript loads the
navigation from toc.json, which old docfx versions do not generate on their own.
