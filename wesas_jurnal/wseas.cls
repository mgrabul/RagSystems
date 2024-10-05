%%Identification
%%The class identifies itself and the LaTeX version needed
\renewcommand{\normalsize}{\fontsize{11pt}{13pt}\selectfont}
%
\newcommand{\headlinecolor}{\normalcolor}

%\DeclareOption{onecolumn}{\OptionNotUsed}
%\DeclareOption{green}{\renewcommRequirePackageand{\headlinecolor}{\color{green}}}
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%\ProcessOptions\relax

\LoadClass[twocolumn,a4paper]{article}

\RequirePackage{color}

\RequirePackage{abstract}
\RequirePackage{titlesec}
\RequirePackage[top=2.5cm, bottom=2.5cm, left=1.8cm, right=1.8cm,includefoot]{geometry}
\RequirePackage{xcolor}
\RequirePackage{flushend}
\RequirePackage{enumitem}
\RequirePackage{hyperref}

%\usepackage{showframe}
\usepackage{xcolor}    % for highlighting text (e.g. \hl)
\usepackage{soul}      % for highlighting text (e.g. \hl)
\usepackage{ragged2e}  % for text alignment    (e.g. \justify)

\RequirePackage{fontspec}
\setmainfont{Times New Roman}

\providecommand{\keywords}[1]{\flushleft\textit{Key-Words:} #1}
\providecommand{\dates}{\flushleft}


\setlength\columnwidth{8.2cm}
\setlength\columnsep{1cm}
\setlength{\parindent}{.5cm} % Default is 15pt.


\renewcommand{\maketitle}{%
\centering
%\fontsize{16pt}{19pt}\fontfamily{rm}\fontseries{b}%
%\fontshape{sl}\selectfont\headlinecolor
\textbf{\fontsize{16pt}{19pt}\textbf{\@title}\bfseries}
 \vskip 2ex%
{\normalfont\large
\begin{tabular}[t]{c}%
\@author
      \end{tabular}
      }\par%
       \vskip 1ex%
}
%
%
\titleformat*{\section}{\flushleft\fontsize{14pt}{17pt}\bfseries}
\titleformat*{\subsection}{\flushleft\fontsize{12pt}{15pt}\bfseries}
\titleformat*{\subsubsection}{\flushleft\fontsize{11pt}{14pt}\bfseries}
\titleformat*{\paragraph}{\large\bfseries}
\titleformat*{\subparagraph}{\large\bfseries}


\renewcommand{\normalsize}{\fontsize{11pt}{12pt}\selectfont}
%\setlength{\textwidth}{17.5cm}
%\setlength{\textheight}{25cm}


\renewenvironment{abstract}{
  \normalfont
  \list{}{
    \labelwidth0pt
    \leftmargin0pt \rightmargin\leftmargin
    \listparindent\parindent \itemindent0pt
    \parsep0pt
    \let\fullwidthdisplay\relax}
  \item[\hskip\labelsep \textit{\abstractname :}] }{\endlist}


\titlespacing*{\section}
{0pt}{2ex}{0ex}
\titlespacing*{\subsection}
{0pt}{2ex}{0ex}
\titlespacing*{\subsubsection}
{0pt}{2ex}{0ex}

\providecommand{\references}{\flushleft\textit{References:}}

\pagenumbering{gobble}


\renewcommand\refname{   \normalfont\fontsize{11pt}{12pt}\flushleft\textit{References:}}



%%
%\usepackage{letltxmacro}
%
%\newlength{\fsize}
%% https://tex.stackexchange.com/q/88001/5764
%\LetLtxMacro\oldselectfont\selectfont
%
%\DeclareRobustCommand{\selectfont}{\oldselectfont\setlength{\fsize}{\f@size pt}}