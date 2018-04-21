#!/usr/bin/env perl
#$latex            = 'uplatex -synctex=1 -halt-on-error';
$latex            = "find . -type f -name '*.tex' | xargs sed -i '' -e 's/、/，/g' -e 's/。/．/g'; uplatex -synctex=1 -halt-on-error %O %S";
$latex_silent     = 'uplatex -synctex=1 -halt-on-error -interaction=batchmode';
$bibtex           = 'upbibtex';
$biber            = 'biber --bblencoding=utf8 -u -U --output_safechars';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode         = 3; # generates pdf via dvipdfmx

# Prevent latexmk from removing PDF after typeset.
# This enables Skim to chase the update in PDF automatically.
$pvc_view_file_via_temporary = 0;

# Use Skim as a previewer
$pdf_previewer    = "qpdfview";
