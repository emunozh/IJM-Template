%                                           
%    IJM_article.cls             
%    version:
     \def\IJMversion{1.00}
%    Author: Esteban Munoz (emunozh@gmail.com)
%    Last Update:
     \def\IJMdate{2015/06/21}
%
%    See readme for a brief tutorial on how to use this class
%                                           
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    A Simple style class to format
%    articles matching the IJM Template.
%    This style class is based on the 
%    article class
%    based on bmc_article.cls ver: 1.03
%      http://www.biomedcentral.com/authors/tex 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 

\def\@journal{International Journal of Microsimulation}
\def\@company{International Microsimulation Association}

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{IJM-article}[\IJMdate, v\IJMversion, \@journal]
\LoadClassWithOptions{article} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Packages used for this class

%% provides Garamond fonts
%% based on information provideb by: Jürgen Wiemers. Thanks!
\RequirePackage[urw-garamond]{mathdesign}

%% For cross referencing
\RequirePackage{hyperref}

%% Graphics integration (need to place the logo)
\RequirePackage[pdftex]{graphicx}

%% Compute the last page number (need for the header)
\RequirePackage{lastpage}

%% Line separation
\RequirePackage{setspace}
\doublespacing

%% Paragraph separation
\RequirePackage{parskip}
\setlength{\parindent}{0pt}
\setlength{\parskip}{-1em plus2mm minus2mm}

%% Formating web addresses and email
\RequirePackage{url}

%% For absolute positioning of text and figures
% I need this to place the logo on the first page
\RequirePackage[absolute]{textpos}

%% Bib APA
\RequirePackage[notocbib, nosectionbib]{apacite}

%% make all footnotes endnotes
\RequirePackage{endnotes}
\let\footnote=\endnote

%% Captions
\RequirePackage{ccaption} % allows special formating of the captions
% defines the font of the caption name (e.g. Figure: or Table:)
\captionnamefont{\footnotesize\bf}
% defines the font of the caption text
\captiontitlefont{\footnotesize\bf}
%\setlength{\belowcaptionskip}{10pt}
\captionstyle{\raggedright}

%% Headers
\RequirePackage{fancyhdr}

%% Geometry
\RequirePackage[
    a4paper,
    width=16cm,
    left=2.5cm,
    height=24.7cm,
    top=2.5cm,
    headheight=2cm,
    headsep=.5cm,
    marginparsep=0cm,
    footskip=0.7cm,
]{geometry}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Header and Footer
%
% A4 page 21.0 × 29.7
% -2.5    16.0 x 24.7
%
%           /--------210------------------------/
%                    paper width
%        -  +-----------------------------------+  -        -
%        |  |                                   |  |        | = 0
%        |  | - - - - - - - - - - - - - - - - - |  |        -
%        |  | header                            |  | Top    |  20 headheight 
%        |  | - - - - - - - - - - - - - - - - - |  | 25     -
%        |  |                                   |  |        |   5 headsep
%        |  | - - - - - - - - - - - - - - - - - |  -        -
%    297 |  |         |                         |  |        |
% paper- |  |         |body                     |  | height | 247 text hight
% height |  | |-------+-----------------------| |  | 247    |
%        |  |         |                         |  |        |
%        |  |         |                         |  |        |
%        |  |         |                         |  |        |
%        |  |         |                         |  |        |
%        |  |         |                         |  |        |
%        |  |         |                         |  |        |
%        |  |         |                         |  |        |
%        |  |         |                         |  |        |
%        |  |         |                         |  |        |
%        |  |         |                         |  |        |
%        |  |         |                         |  |        |
%        |  |         |                         |  |        |
%        |  |         |                         |  |        |
%        |  |         |                         |  |        |
%        |  | - - - - - - - - - - - - - - - - - |  -        -
%        |  |                                   |  |        |   7 footskip
%        |  | - - - - - - - - - - - - - - - - - |  |        -
%        |  | footer                            |  | bottom |     footer hight
%        |  | - - - - - - - - - - - - - - - - - |  | = 25   -
%        |  |                                   |  |        |     
%        -  +-----------------------------------+  -        -
%
%           /-/-------------------------------/-/
%           25                160             = 210 - 160 - 25 = 25
%           left (inner)    text width        right (outer)         
%

\pagestyle{fancy}
\fancyhf{}

%% Normal page
\fancypagestyle{normalpage}{ %
\fancyhf{}
\restoregeometry
\lhead{
    \begin{footnotesize}
        \textsc{\@journal \@ijm@issue}
    \end{footnotesize}
}
\rhead{
    \begin{footnotesize}
        \thepage
    \end{footnotesize}
}
\lfoot{
    %\fontsize{8.04pt}{1em}
    \begin{footnotesize}
    \parbox[t]{.2\textwidth}{
        \textsc{\@ijm@lastname}}
        \hspace{.3cm}
    \parbox[t]{.76\textwidth}{
        \textit{\@title}}
    \end{footnotesize}
    }
\renewcommand{\headrulewidth}{0pt} % remove lines as well
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\headwidth}{17cm}
}

%% Title Page
\fancypagestyle{titlepage}{
\fancyhf{}
% The title page has different margins 
\newgeometry{height=24.2cm, top=3cm}
\lhead{
    \begin{footnotesize}
        \textsc{\@journal \@ijm@issue}\vspace{.2cm} \\ 
        \textsc{\@company}
    \end{footnotesize}
}
\renewcommand{\headrulewidth}{0pt} % remove lines as well
\renewcommand{\footrulewidth}{0pt}
}

%% Logo
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{\TPHorizModule}
\textblockorigin{0mm}{0mm} % top-left
\AtBeginDocument{
\begin{textblock}{6}(12,1.5)
    \includegraphics[scale=0.31]{logo}
\end{textblock}
\pagestyle{normalpage}
}

%% Last name, need for footer
\let\ijm@lastname\@empty
\def\@ijm@lastname{\relax\ijm@lastname}

%% Issue number
\gdef\ijm@issue{}
\newcommand\ijm@curissue{}
\newcommand\issue[4]{\relax
    \g@addto@macro\ijm@issue{(#1) #2(#3) #4-\pageref{LastPage}}
    \setcounter{page}{#4}
}
\def\@ijm@issue{\ijm@issue}  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Front page

%% Email.
\def\email#1{
    \g@addto@macro\ijm@authors{\url{#1} \vspace{.5cm} \\}
    }

%% Address
\def\address#1{
    \g@addto@macro\ijm@authors{#1\\}
    }

%% Place
\def\place#1{\def\@place{\footnotesize#1\end{hi}}}

%% Author
\def\ijm@authors{}
\newcounter{author}
\def\author{\@author}

\def\@author[#1]#2{
    % author name
    \g@addto@macro\ijm@authors{\textbf{#2} \vspace{.5cm} \\}
    % lastname
    \ifx \ijm@lastname \@empty
        \gdef\ijm@lastname{}
        \g@addto@macro\ijm@lastname{#1}
    \else
        \g@addto@macro\ijm@lastname{, #1}
    \fi}

%% Maketitle
\let\old@maketitle\maketitle
\renewcommand\maketitle{  
   \begin{singlespace}
    \global\let\@date\@empty
    \sffamily
    \begin{minipage}{\textwidth}
        \newpage
        \thispagestyle{titlepage}
        \vspace{3.4cm}
            {\doublespacing \noindent \centering \normalsize \normalfont \bfseries
            \@title \par}
        \vspace{2cm}
            {\noindent \normalsize \normalfont \ijm@authors \par}
        \vspace{3em}
    \end{minipage}
    \end{singlespace}
}

%% Reformat the  abstract 
%\let\old@abstract\abstract 
\renewenvironment{abstract}{  
      \ifhmode\begingroup\parskip0pt\par\noindent\endgroup\fi
         {\noindent\bfseries ABSTRACT:}}{\\
         \ifhmode\begingroup\parskip0pt\par\noindent\endgroup\fi
         {\noindent\textbf{KEYWORDS:} \@ijm@key}
         \vspace{0.3cm} \\
         {\noindent\textbf{JEL classification:} \@ijm@jel}
      \newpage
   }

%% JEL Classification
\newcommand\JELclassification[1]{\def\@ijm@jel{\relax#1}}

%% Keywords
\newcommand\keywords[1]{\def\@ijm@key{\relax#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% General Configuration

%% Reformat Enviroments
\newlength{\wideitemsep}
\setlength{\wideitemsep}{1em}
\let\olditem\item
\renewcommand{\item}{
    \setlength{\itemsep}{\wideitemsep}
    \olditem}

%% Reformat Sections
\renewcommand\section{\@startsection{section}{1}{\z@}
                     {2em}{2em}
                     {\bfseries\uppercase}}
%TODO: fit to original template
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}
                     {-0.84cm \@plus -1ex \@minus -.2ex} {.2ex \@plus.2ex}
                     {\bfseries\sffamily}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}
                     {-0.84cm \@plus -1ex \@minus -.2ex} {.2ex \@plus.2ex}
                     {\itshape}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}
                     {-.2em \@plus1ex \@minus.2ex} {-0.5em}
                     {\bfseries\sffamily}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}
                     {-.2em \@plus1ex \@minus.2ex} {-0.5em}
                     {\sffamily}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% General Configuration
%% var
\def\hi{}
\def\pb{\mbox{}\\}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Endnotes
\AtEndDocument{
    \begin{minipage}{\textwidth}
    \begingroup
    \def\enoteheading{
        \vspace{4em}
        \rule{6cm}{.1pt}%
        \vspace{1em}
    }
    \theendnotes
    \endgroup
    \end{minipage}
}

\endinput
%% end of IJM-article.cls
