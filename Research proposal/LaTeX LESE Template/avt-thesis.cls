\ProvidesClass{avt-thesis}

% Configure and load scrbook
\newcommand{\baseclass}{scrbook}
\DeclareOption*{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}
\PassOptionsToClass{
    oneside,
    paper=a4,
    parskip,
    pointlessnumbers,
    listof=totoc
}{\baseclass}
\ProcessOptions\relax
\LoadClass{\baseclass}

% Configure some packages
\PassOptionsToPackage{english}{babel} 
\PassOptionsToPackage{babel}{csquotes}
\PassOptionsToPackage{english,plain}{fancyref}
\PassOptionsToPackage{fleqn}{amsmath}
\PassOptionsToPackage{headsepline,plainheadsepline}{scrpage2}
\PassOptionsToPackage{amssymb}{SIunits}
\PassOptionsToPackage{bottom=3cm}{geometry}
\PassOptionsToPackage{
    backend=biber,
    sorting=none,
    maxnames=12,
    abbreviate=false,
    giveninits=true
}{biblatex}
\PassOptionsToPackage{version=4}{mhchem}
\PassOptionsToPackage{intoc}{nomencl}

% And load them
\RequirePackage{
  fontenc,  % Schriftkodierung
  color,    % LaTeX in Farbe und bunt
  textcomp, % viel mehr Symbole
  amssymb,  % noch mehr Symbole
  caption,  % Captions formatieren
  booktabs, % Tabellen formatieren
  babel,    % Fremdsprachen, hier: Deutsch und Englisch
  graphicx, % Einbinden von Grafiken
  csquotes, % Zitieren mit Stil
  amsmath,  % erweiterter Mathesatz 
  fancyref, % flexible automatische Referenzen
  subcaption,% Unterbilder in einer figure-Umgebung
  rotating, % Tabellen und Abbildungen im Querformat
  array,    % Tabellen mit zusaetzlichen Eigenschaften ausstatten
  longtable,% Tabellen laenger als eine Seite
  geometry, % Seitenlayout setzen
  listings,
  biblatex,
  todonotes,
  setspace, % Zeilenabstand konfigurieren
  scrlayer-scrpage, % Kopf- und Fusszeilen formatieren
  hyperref,
  calc,
  tikz,     % Drawings
  standalone,
  pgfplots, % Plots
  siunitx,  % Automatic unit typesetting
  chemfig,  % Complex chemical structures
  float,
  geometry,
  multirow,
  mhchem,   % Reaktionsgleichungen
  amsthm,
  multicol,
  enumitem,
  pst-barcode,
  nomencl,
  textgreek
}

% Use sans serif font
\renewcommand{\familydefault}{\sfdefault}

% Set up page header
\pagestyle{scrheadings}
\clearscrheadfoot
\setheadsepline{0.2pt}
\setkomafont{pageheadfoot}{\normalfont\small}
\ihead{\headmark}
\ohead[\pagemark]{\pagemark}
\setkomafont{pageheadfoot}{\normalfont\small}

\setkomafont{pagenumber}{\normalfont\bfseries}

\addtocontents{toc}{\protect\thispagestyle{empty}}

% Default graphics size
\setkeys{Gin}{width=0.9\textwidth,height=0.6\textheight,keepaspectratio=true}


% Define some RWTH and AVT colors
\definecolor{avtcolor}{RGB}{14,133,196}
\definecolor{rwthblue}{RGB}{0,83,159}
\definecolor{186blau}{rgb}{0.729 ,0.859, 0.941}
\definecolor{135blau}{rgb}{0.529,0.82,0.941}
\definecolor{64blau}{rgb}{0.25,0.741,0.827}
\definecolor{79gruen}{rgb}{0.31,0.663,0.153}
\definecolor{194gruen}{rgb}{0.761,0.81,0}
\definecolor{178grau}{rgb}{0.7,0.7, 0.7}
\definecolor{0blau}{rgb}{0 ,0.506, 0.776}

\urlstyle{sf}

% Setup hyperlinks in PDF
\hypersetup{
    colorlinks=true,
    citecolor=black,
    linkcolor=black,
    bookmarksnumbered=true,
    urlcolor=black,
    plainpages=false,
    breaklinks=true
}

% Standard configuration for source code
\lstset{
    basicstyle={\fontfamily{qcr}\selectfont\footnotesize},
    keywordstyle=,
    commentstyle=\scriptsize,
    breaklines=true,
    language=Matlab,
    captionpos=b,
    numbers=left,
    numberstyle=\tiny,
    frame=none,
    tabsize=4,
    showstringspaces=false
}


% Configure PGF and Tikz for common use
\pgfplotsset{compat=newest}
\usepgfplotslibrary{groupplots}
\usetikzlibrary{arrows,positioning,shapes,calc,patterns,decorations.pathreplacing}
\tikzset{>=Stealth}
\usepgfplotslibrary{fillbetween}
\usetikzlibrary{automata}
\usetikzlibrary{plotmarks}

% Define some theorem environments
\newtheorem{definition}{Definition}
\numberwithin{definition}{section}
\newtheorem{hypothesis}{Hypothesis}
\numberwithin{hypothesis}{section}
\newtheorem{assumption}{Assumption}
\numberwithin{assumption}{section}

% Define Molar unit
\DeclareSIUnit\Molar{\textsc{m}}


% Patch nomencl package
\usepackage{xpatch}
\makeatletter
\xapptocmd\thenomenclature{\let\@item\nomencl@item\def\nomencl@width{0pt}}{}{}
\let\nomencl@item\@item
\xpretocmd\nomencl@item{\nomencl@measure{#1}}{}{}
\def\nomencl@measure#1{%
  \sbox0{#1}%
  \ifdim\wd0>\nomencl@width\relax
    \edef\nomencl@width{\the\wd0}%
  \fi
}
\xapptocmd\endthenomenclature{%
  \immediate\write\@mainaux{\global\nomlabelwidth\nomencl@width\relax}%
}{}{}
\makeatother

\setlength{\nomitemsep}{-\parsep}