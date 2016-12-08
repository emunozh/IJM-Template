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
\ProvidesPackage{IJM-article}[\IJMdate, \IJMversion, \@journal]
\LoadClassWithOptions{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Packages used for this class

%% provides Garamond fonts
\RequirePackage{ebgaramond}
%% command to bold garamond even though strictly speaking it's a substitute
\newcommand{\fakebf}{\fontfamily{mdugm}\fontseries{b}\selectfont}
\DeclareTextFontCommand{\textbf}{\fakebf}


%% For cross referencing
\RequirePackage{hyperref}

%% Graphics integration (need to place the logo)
\RequirePackage[pdftex]{graphicx}

%% Compute the last page number (need for the header)
\RequirePackage{lastpage}

%% Line separation
\RequirePackage{setspace}
\linespread{1.25}

\RequirePackage{parskip}

%% Formating web addresses and email
\RequirePackage{url}

%% For absolute positioning of text and figures
% I need this to place the logo on the first page
\RequirePackage[absolute]{textpos}

%% Bib APA
\RequirePackage[notocbib, nosectionbib]{apacite}

%% make all footnotes endnotes
\RequirePackage{endnotes}
\let\footnote=\endnote%

%% Captions
\RequirePackage{ccaption} % allows special formating of the captions
% defines the font of the caption name (e.g. Figure: or Table:)
\captionnamefont{\scriptsize\fakebf}
% defines the font of the caption text
\captiontitlefont{\scriptsize}
%\setlength{\belowcaptionskip}{10pt}
\captionstyle{\raggedright}

%% Headers
\RequirePackage{fancyhdr}

%% Geometry
\RequirePackage[
    a4paper,
    width=16cm,
    left=2.5cm,
    height=24.45cm,
    % we want header to start 10mm away from top of the page
    % however the measures here are not the same as how ms word define them
    % by consequene I adjusted headsep manually until the ruler said they were the same
    top=2.5cm,
    headheight=5.12mm, %this is set by fancyhd
    headsep=6.88mm, %distance from text
    marginparsep=0cm,
    footskip=15.12mm,
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
%        |  |                                   |  |        |  10
%        |  | - - - - - - - - - - - - - - - - - |  |        -
%        |  | header                            |  | Top    |  5.12 headheight
%        |  | - - - - - - - - - - - - - - - - - |  | 25     -
%        |  |                                   |  |        |  9.88 headsep
%        |  | - - - - - - - - - - - - - - - - - |  -        -
%    297 |  |         |                         |  |        |
% paper- |  |         |body                     |  | height | 244.5 text hight
% height |  | |-------+-----------------------| |  | 244.5  |
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
%        |  |                                   |  |        |   9.38 footskip
%        |  | - - - - - - - - - - - - - - - - - |  |        -
%        |  | footer                            |  | bottom |   5.12  footer hight
%        |  | - - - - - - - - - - - - - - - - - |  | = 27.5   -
%        |  |                                   |  |        |    13
%        -  +-----------------------------------+  -        -
%
%           /-/-------------------------------/-/
%           25                160             = 210 - 160 - 25 = 25
%           left (inner)    text width        right (outer)
%

\pagestyle{fancy}
\fancyhf{}

%% Normal page
\fancypagestyle{normalpage}{%
\fancyhf{}
\restoregeometry%
\lhead{ %header-left
    \begin{scriptsize}
        \textsc{\@journal \@ijm@issue}
    \end{scriptsize}
}
\rhead{ %header-right
    \begin{scriptsize}
        \thepage%
    \end{scriptsize}
}
\lfoot{ %foot-left
    %\fontsize{8.04pt}{1em}
    \begin{scriptsize}
    \parbox[t]{.25\textwidth}{
        \textsc{\@ijm@lastname}}
        \hspace{.3cm}
    \parbox[t]{.76\textwidth}{
        \textit{\@title}}
    \end{scriptsize}
    }
\renewcommand{\headrulewidth}{0pt} % remove lines as well
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\headwidth}{17cm}
}

%% Title Page
\fancypagestyle{titlepage}{
\fancyhf{}
% The title page has different margins
% again top at 10mm = 30 (tmargin)- 10.66mm (headheight) - 9.34mm (headsep)

\newgeometry{height=24.2cm, tmargin=3cm,headheight=10.66mm,headsep=9.34mm}
\lhead{
    \begin{scriptsize}
        \textsc{\@journal \@ijm@issue}\vspace{.2cm} \\
        \textsc{\@company}
    \end{scriptsize}
}
\renewcommand{\headrulewidth}{0pt} % remove lines as well
\renewcommand{\footrulewidth}{0pt}
}

%% Logo
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{\TPHorizModule}
\textblockorigin{0mm}{0mm} % top-left
\AtBeginDocument{
\begin{textblock}{6}(12,1)
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
    \g@addto@macro\ijm@issue{(#1) #2(#3) #4-\pageref*{LastPage}}
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
    \ifx \ijm@lastname \@empty%
        \gdef\ijm@lastname{}
        \g@addto@macro\ijm@lastname{#1}
    \else
        \g@addto@macro\ijm@lastname{, #1}
    \fi}

%% Maketitle
\let\old@maketitle\maketitle%
\renewcommand\maketitle{%
   \begin{singlespace}
    \global\let\@date\@empty%
    \sffamily
    \begin{minipage}{\textwidth}
        \newpage
        \thispagestyle{titlepage}
        \vspace{3.4cm}
            {\doublespacing \noindent \centering \normalsize \normalfont \fakebf%
            \@title \par}
        \vspace{2cm}
            {\noindent \normalsize \normalfont \ijm@authors \par}
        \vspace{3em}
    \end{minipage}
    \end{singlespace}
}

%% Reformat the  abstract
%\let\old@abstract\abstract
\renewenvironment{abstract}
% before:
{%
      \textbf{ABSTRACT:}
}%
% after:
{\\ %end previous line
\\ %blank line
         \textbf{KEYWORDS:} \@ijm@key%keywords
          \\ %end previous line
          \\ %other blank line
         \textbf{JEL classification:} \@ijm@jel%JEL
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
\renewcommand{\item}{%
    \setlength{\itemsep}{\wideitemsep}
    \olditem}


% old way of doing it was through this command:
% reference for the meaning of this stuff:
% http://tex.stackexchange.com/a/31795/23288
% \@startsection{<name>}{<level>}{<indent>}{<beforeskip>}{<afterskip>}{<style>}*[<altheading>]{<heading>}

% I do it through titlesec
\RequirePackage{titlesec}

% comment properly for section
\titleformat%
{\section} %command to over-write
[hang] % shape
{\normalfont\fontsize{12}{15}\fakebf}  %format
{\thesection.} %label
{0.5em} % separator
{\MakeUppercase} %before-code
[] %after code

% fontsize{12}{15} means of size 12 with skip of 15.
% notice that \normalfont\fontsize{12}{15} is actually useless since titlesec uses default

% quicker for the other two
\titleformat{\subsection} [hang] {\normalfont\fontsize{12}{15}\fakebf}  {\thesubsection.} {0.5em} {} []
\titleformat{\subsubsection} [hang] {\normalfont\fontsize{12}{15}\itshape}  {\thesubsubsection.} {0.5em} {} []


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% General Configuration
%% var
\def\hi{}
\def\pb{\mbox{}\\}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Endnotes
\AtEndDocument{%
    \begin{minipage}{\textwidth}
    \begingroup
    \def\enoteheading{
        \vspace{4em}
        \rule{6cm}{.1pt}%
        \vspace{1em}
    }
    \theendnotes%
    \endgroup%
    \end{minipage}
}

\endinput%
%% end of IJM-article.cls
