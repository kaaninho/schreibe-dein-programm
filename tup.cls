\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tup}
\LoadClass[10pt,twoside]{book}

\RequirePackage{t1enc}
\RequirePackage{calc}
\RequirePackage{setspace}
\RequirePackage{ebgaramond}
\RequirePackage[light]{FiraSans}

\setlength\paperwidth  {17cm}
\setlength\paperheight {24cm}

\setlength\textwidth{13cm}
\setlength\textheight{18cm}

\setlength\topmargin{-5.6mm}
\setlength\headheight{21pt}
\setlength\headsep{15mm}

\setlength\marginparwidth{-1in}

\setlength\evensidemargin{-10.4mm}
\setlength\oddsidemargin{-0.4mm}

\setstretch{1.3333} % 10pt has 12pt baselineskip

\setlength\parskip{\z@}
\setlength\parindent{6mm}
\setlength\partopsep{6mm}

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{empty}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \@makechapterhead{#2}%
                    \@afterheading
                    }
\def\@makechapterhead#1{%
  {\parindent \z@ \normalfont
    \interlinepenalty\@M
    {\fontsize{13\p@}{13\p@} \sffamily \thechapter\quad
      \MakeUppercase{#1}}\par\nobreak
    \vspace{\baselineskip}
  }}
\def\@schapter#1{\@makeschapterhead{#1}%
                 \@afterheading}
\def\@makeschapterhead#1{%
  {\parindent \z@ \centering
    \normalfont
    \interlinepenalty\@M
    {\fontsize{13\p@}{13\p@} \sffamily \MakeUppercase{#1}}\par\nobreak
    \vspace{\baselineskip}
  }}

% Center starred section headers

\def\@startsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssect{#3}{#4}{#5}{\centering #6}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

\renewcommand{\section}{\@startsection
  {section}%
  {1}%
  {\z@}%
  {-24\p@ \@plus -4\p@ \@minus -2\p@}%
  {12\p@ \@plus 2\p@ \@minus 4\p@}%
  {\normalfont\fontsize{12\p@}{16\p@}\sffamily\MakeUppercase}}
\renewcommand{\subsection}{\@startsection
  {subsection}%
  {2}%
  {\z@}%
  {-16\p@ \@plus -4\p@ \@minus -2\p@}%
  {10\p@ \@plus 2\p@ \@minus 4\p@}%
  {\normalfont\fontsize{10\p@}{15\p@}\sffamily\MakeUppercase}}
\renewcommand{\subsubsection}{\@startsection
  {subsubsection}%
  {2}%
  {\z@}%
  {-16\p@ \@plus -2\p@ \@minus -1\p@}%
  {9\p@ \@plus 2\p@ \@minus 4\p@}%
  {\normalfont\fontsize{9\p@}{16\p@}\sffamily\MakeUppercase}}
\renewcommand{\paragraph}{\@startsection
  {subsubsection}%
  {2}%
  {\z@}%
  {-16\p@ \@plus -2\p@ \@minus -1\p@}%
  {12\p@ \@plus 4\p@ \@minus 4\p@}%
  {\normalfont\fontsize{9\p@}{16\p@}\sffamily\MakeUppercase}}
\newcommand\@barafter[1]{#1 \vrule}
\renewcommand\paragraph{\@startsection
  {paragraph}%
  {4}%
  {\z@}%
  {3.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\normalfont\fontsize{9\p@}{16\p@}\sffamily\bfseries\@barafter}}


\renewcommand\tableofcontents{%
    \cleardoublepage
    \pagenumbering{roman}
    \chapter*{\contentsname
        \@mkboth{\contentsname}{\contentsname}}%
    \setcounter{page}{5}
    {\parskip 0pt\vspace{-1ex}\@starttoc{toc}}%
    \cleardoublepage
    \pagenumbering{arabic}
    }

\renewenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\indexname}%
                        {\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}

\RequirePackage[hang]{footmisc}

\renewcommand\hangfootparindent{6mm}
\renewcommand\footnotelayout{\sffamily}
\setlength{\skip\footins}{8mm}
\setlength{\footnotesep}{1mm}
\renewcommand\footnotesize{%
   \@setfontsize\footnotesize{7.2pt}{9.5pt}%
   \abovedisplayskip 8\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \belowdisplayskip \abovedisplayskip
 }
% We tried this but the footnote marks in the text and the footnote
% are both affected.  No easy way to untangle them in footmisc.
% \renewcommand\@makefnmark{\mbox{\textsf{\@thefnmark}}}
 
\setlength\abovecaptionskip{2\p@}
\setlength\belowcaptionskip{\z@}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\fontsize{7.5\p@}{9.5\p@}\textsf{\textbf{#1:} #2}}%
  \ifdim \wd\@tempboxa >\hsize
    {\fontsize{7.5\p@}{9.5\p@}\textsf{\textbf{#1:} #2}}\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\box\@tempboxa}%
  \fi
  \vskip\belowcaptionskip}

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\lhead[\fontsize{7.5\p@}{7.5\p@}\textsf{\thepage}]{\fontsize{7.5\p@}{7.5\p@}\textsf{\MakeUppercase{\rightmark}}}
\rhead[\fontsize{7.5\p@}{7.5\p@}\textsf{\MakeUppercase{\leftmark}}]{\fontsize{7.5\p@}{7.5\p@}\textsf{\thepage}}
\renewcommand{\headrulewidth}{0.5pt}
\chead{}
\lfoot{}
\rfoot{}
\cfoot{}

\def\chaptermark#1{%
  \markboth{{#1}}{}}%
\def\sectionmark#1{%
  \markboth{{#1}}{#1}}

% Blank pages don't have a header
% From the docs for fancyhdr
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}


\RequirePackage{enumitem}

\setlist{nosep,labelindent=0pt,labelsep=0.5em,labelwidth=6mm}
\setlist[1]{leftmargin=6mm}
\setlist[2]{leftmargin=3mm}
\setlist[3]{leftmargin=3mm}
\setlist[4]{leftmargin=3mm}

\setlength\floatsep      {12pt}
\setlength\textfloatsep  {24pt}
\setlength\intextsep{18pt}

\setlength\abovedisplayskip{6\p@ \@plus 1\p@ \@minus 3\p@}
\setlength\belowdisplayskip{6\p@ \@plus 1\p@ \@minus 3\p@}
\setlength\abovedisplayshortskip{6\p@ \@plus 1\p@ \@minus 3\p@}
\setlength\belowdisplayshortskip{6\p@ \@plus 1\p@ \@minus 3\p@}

\def\@biblabel#1{}
