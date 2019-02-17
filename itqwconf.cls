%%
%% This is file `itqwconf.cls'.
%%
%% LaTeX template for the ITQW conference.
%% See http://www.itqw2019.com/abstract-submission for submission guidelines.
%%
%% Copyright (C) 2019 by Michael Riesch <michael.riesch@tum.de>
%%
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%%
%%    http://www.latex-project.org/lppl.txt
%%
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{itqwconf}[2019/02/17 v1.0 ITQW conference abstract]

% load article base class
\LoadClass[11pt,letterpaper,notitlepage]{article}

% set paper size and margins
\RequirePackage[letterpaper,includemp=false,margin=3.17cm,noheadfoot]{geometry}

% no page numbers
\pagestyle{empty}

% font encoding and face (Times)
\RequirePackage[T1]{fontenc}
\RequirePackage{newtxtext,newtxmath}
\renewcommand{\familydefault}{\rmdefault}

% custom references section
\RequirePackage{cite}
\let\oldthebibliography=\thebibliography
\let\endoldthebibliography=\endthebibliography
\renewenvironment{thebibliography}[1]{%
  \FloatBarrier
  \begin{oldthebibliography}{#1}%
    \setlength{\parskip}{0ex}%
    \setlength{\itemsep}{0ex}%
    \normalfont\small
}{%
  \end{oldthebibliography}%
}

% custom abstract
\renewenvironment{abstract}{\par\large\textbf{Short Abstract}\normalsize~}
                 {\par}

% input encoding
\RequirePackage[utf8]{inputenc}

% avoid widows and orphans
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000

% Load base packages
\RequirePackage[english]{babel}
\RequirePackage{graphicx}
\RequirePackage[hidelinks,breaklinks]{hyperref}

% affiliations
\newcommand{\authormark}[1]{\textsuperscript{\normalfont\textbf{#1}}}
\newcounter{affil}
\let\theaffil\empty
\newcommand{\printaffil}[2]{%
%  \ifnum\value{affil}>1{%
    \textsuperscript{#1}~#2%
%  }\else{%
%    #2%
%  }\fi
}
\newcommand{\affil}[2][]{%
  \ifnum\value{affil}>0{%
    \makeatletter
    \g@addto@macro{\theaffil}{\par\printaffil{#1}{#2}}
    \makeatother
  }\else{%
    \makeatletter
    \g@addto@macro{\theaffil}{\printaffil{#1}{#2}}
    \makeatother
  }\fi
  \addtocounter{affil}{1}
}
\newcommand{\theemail}{}
\newcommand{\email}[1]{\renewcommand{\theemail}{#1}}

% custom section titles
\RequirePackage[noindentafter]{titlesec}
\titleformat{\section}{\normalfont\large\bfseries}{\thesection.~}{0pt}{}
\titlespacing{\section}{0pt}{12pt plus 0pt minus 0pt}{6pt plus 0pt minus 0pt}

% prevent floats in title
\RequirePackage{placeins}

% custom title
\RequirePackage{xcolor}
\makeatletter
\renewcommand{\maketitle}{%
  \newpage
  \begin{center}
    \fontsize{16pt}{19pt}\selectfont\textbf{\@title}\par
    \vskip18pt
    \large\textbf{\@author}\par
    \small\textit{\theaffil}\par
    \small\textit{*Contact Email: \textcolor{blue}{\underline{\theemail}}}\par
    \vskip24pt
  \end{center}
  \FloatBarrier
  \@afterindentfalse
  \@afterheading
  \setlength{\parskip}{6pt}
}
\makeatother

% indentation
\setlength{\parindent}{0cm}

% custom captions
\RequirePackage[margin=1cm]{caption}
\DeclareCaptionLabelFormat{figureabbr}{Figure~#2}
\DeclareCaptionLabelFormat{tableabbr}{Table~#2}
\captionsetup[figure]{labelformat=figureabbr,labelfont=bf,font=footnotesize,
  labelsep=colon}
\captionsetup[table]{labelformat=tableabbr,labelfont=bf,font=footnotesize,
  labelsep=colon}

% custom page bottom
\renewcommand{\footnoterule}{}
\raggedbottom
\AtEndDocument{%
  \clearpage
}
%%
%% End of file `epsconf.cls'.
