\ProvidesClass{twentysecondcv}[2015/02/28 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%-----------------------------------------------------------------------	-----------------

\RequirePackage[quiet]{fontspec}
\usepackage{fontspec}
\setmainfont{IBM Plex Sans}
\usepackage[document]{ragged2e}
%\RequirePackage[sfdefault]{ClearSans}

\def\arrow#1{\pspicture[shift=2pt](#1,0)\psline{->}(#1,0)\endpspicture}

\usepackage{pstricks}

\usepackage{fontawesome}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}

\usepackage{setspace}
\usepackage{enumitem}
\setlist[itemize]{leftmargin=*}

\RequirePackage[hidelinks]{hyperref}
\hypersetup{
    pdftitle={},
    pdfauthor={},
    pdfsubject={},
    pdfkeywords={},
    colorlinks=false,           % no lik border color
    allbordercolors=white       % white border color for all
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\ifxetex
  \usepackage{letltxmacro}
  \setlength{\XeTeXLinkMargin}{1pt}
  \LetLtxMacro\SavedIncludeGraphics\includegraphics
  \def\includegraphics#1#{% #1 catches optional stuff (star/opt. arg.)
    \IncludeGraphicsAux{#1}%
  }%
  \newcommand*{\IncludeGraphicsAux}[2]{%
    \XeTeXLinkBox{%
      \SavedIncludeGraphics#1{#2}%
    }%
  }%
\fi

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{F4F7Fb}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}

\definecolor{pblue}{HTML}{0395DE}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pblue}{HTML}{0395DE}
\definecolor{materialpurple}{HTML}{9C27B0}
\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialblue}{HTML}{2196F3}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50}
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialbrown}{HTML}{795548}
\definecolor{materialred}{HTML}{FF4436}
\definecolor{materialorange}{HTML}{FF5722}
\definecolor{linkedin}{HTML}{0085AE}
\definecolor{test}{HTML}{0077be}
\definecolor{yt}{HTML}{c71610}
\definecolor{profilecolor}{HTML}{494C4F}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

% \renewcommand{\bfseries}{\color{black}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

% --------------------------------------------------------------------------------------
% 	FONTS
%-------------------------------------------------------------------------------------
\newfontfamily\headingfont[Path = fonts/]{Plexregular.ttf}
%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newcommand{\profilesection}[2]{\vspace{2pt}{\color{black!80} \huge #1 \rule[0.15\baselineskip]{#2}{1pt}}}

% Define custom commands for CV info
\newcommand{\cvpic}[1]{\renewcommand{\cvpic}{#1}}
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
% \newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

% Command for printing the contact information icons

% Command for printing skill progress bars
\newcommand\programming[1]{ 
	\renewcommand{\programming}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\node [above right] at (0,\i/2) {\x};
			}
		\end{tikzpicture}
	}
}
\newcommand\interests[1]{ 
	\renewcommand{\programming}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\node [above right] at (0,\i/2) {\x};
			}
		\end{tikzpicture}
	}
}
\newcommand\technologies[1]{ 
	\renewcommand{\technologies}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\node [above right] at (0,\i/2) {\x};
			}
		\end{tikzpicture}
	}
}
\newcommand\designskills[1]{ 
	\renewcommand{\designskills}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\node [above right] at (0,\i/2) {\x};
			}
		\end{tikzpicture}
	}
}
\newcommand\projects[1]{ 
	\renewcommand{\projects}{
		{#1}
	}
}

%----------------------------------------------------------------------------------------
%  SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
    \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=sidecolor, anchor=north, minimum width=8cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
  \end{tikzpicture}

  %------------------------------------------------

  \begin{textblock}{6}(0.5, 0.1)

    %------------------------------------------------
    
        \vspace{4mm}
    \cvpic
    \vspace{4mm}
    
    {\LARGE\color{black}\cvname}
    
    %------------------------------------------------
    
    {\large\color{black!80}\cvjobtitle}

    %------------------------------------------------

    \renewcommand{\arraystretch}{1.2}
    \begin{tabular}{p{0cm} @{\hskip 0.1cm}p{6cm}}
      \ifthenelse{\equal{\cvnumberphone}{}}{}{
            & \cvnumberphone} \\
    %   \ifthenelse{\equal{\href{\cvsite}{\cvsite}}{}}{}{
    %         {$
    %           \begin{array}{l}
    %           \hspace{2.8mm} \huge \textnormal{\textcolor{test}{\faGlobe}}
    %           \end{array}
    %           $} 
    %         & \href{http://\cvsite}{\cvsite} \\}
      \ifthenelse{\equal{\cvmail}{}}{}{
         
            & \href{mailto:\cvmail}{\cvmail} \\}
      
       \ifthenelse{\equal{\cvlinkedin}{}}{}{
             & \href{https://www.linkedin.com\cvlinkedin}{\cvlinkedin} \\
            }  
        \ifthenelse{\equal{\cvgithub}{}}{}{
             & \href{https://www.github.com/\cvgithub}{\cvgithub} \\
            }
            
    \end{tabular}

    %------------------------------------------------
    \vspace{4mm}
    
    {\large \textbf{Overview}}

	\skills
        
        %------------------------------------------------
        
        \vspace{2mm}
	    
	    
	{\large \textbf{Programming Languages}} 

		\programming

	{\large \textbf{Frameworks}}
    
	    \technologies
	    
	{\large \textbf{Design Skills}}
    
	    \designskills
  \end{textblock}
}

\newcommand{\makeprofiletwo}{
    \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=sidecolor, anchor=north, minimum width=8cm, minimum height=		\paperheight+1cm] (box) at (-5cm,0.5cm){};
  \end{tikzpicture}
}
%----------------------------------------------------------------------------------------
%	 COLOURED TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=2pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

\def\@sectioncolor#1#2#3{%
	{%
		\textbf{\color{black} #1#2#3}%
	}%
}


\renewcommand{\section}[1]{
	\color{profilecolor}
  \par\vspace{\parskip}
	{%	
		\LARGE\headingfont
		\color{black}%
		\@sectioncolor #1%
	}
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\Large\headingfont\color{headercolor} #1%
	}
	\par\vspace{.25\parskip}%
}

\pagestyle{empty}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\color{profilecolor}\large
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

% \newcommand{\twentyitem}[5]{%
% 	#1&\parbox[t]{0.83\textwidth}{%
% 		\textbf{#2}% 
% 		\hfill%
% 		{\footnotesize#3}\\%
%         \ifblank{#4}{}{#4 \\}
% 		#5\vspace{\parsep}%
% 	}\\
% }

\newcommand{\twentyitem}[6]{%
	{\Large#1}\\
	\parbox[t]{0.9\textwidth}{%
		\vspace{2pt}
		\textbf{\large#3}% 
		\hfill%
		\vspace{1mm}
		{\footnotesize#4}%
        }\\%
    {\normalsize#2}\\
    \parbox[t]{1.0\textwidth}{%
		\ifblank{#5}{}{#5 \\}
		#6%
	}\\
}

\projects

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\color{profilecolor}
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[3]{%
	#1&\parbox[t]{1.0\textwidth}{%
		#2%
		\hfill
		{\footnotesize#3}
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=8cm,top=0.1cm,right=1cm,bottom=0.1cm,nohead,nofoot]{geometry}


\usepackage{smartdiagram}
\smartdiagramset{
    bubble center node font = \footnotesize,
    bubble node font = \footnotesize,
    % specifies the minimum size of the bubble center node
    bubble center node size = 0.5cm,
    %  specifies the minimum size of the bubbles
    bubble node size = 0.5cm,
    % specifies which is the distance among the bubble center node and the other bubbles
    distance center/other bubbles = 0.4cm,
    % sets the distance from the text to the border of the bubble center node
    distance text center bubble = 0.5cm,
    % set center bubble color
    bubble center node color = pblue,
    % define the list of colors usable in the diagram
    set color list = {},
    % sets the opacity at which the bubbles are shown
    bubble fill opacity = 1,
    % sets the opacity at which the bubble text is shown
    bubble text opacity = 1,
}

