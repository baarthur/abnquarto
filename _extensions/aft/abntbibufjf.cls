%% abntbibufjf.cls, v-2.1 JB-LP-LA
%% 
  %% Copyright 2014 Jos\'e Barbosa (ICE-UFJF), Larissa Pinheiro (CDC-UFJF), L\'ivia Alonso (CDC-UFJF). 
  % set2019: version 2. 
  % nov2020: version 2.1.
  % This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
%
% This work has the LPPL maintenance status `maintained'.
%   
  % The Current Maintainer of this work is Jos\'e Barbosa (ICE-UFJF).
  %
  % This work consists of the file abntbibufjf.cls.

%------------------------------------
%------------------------------------

%%Alguns acentos foram desprezados neste arquivo.

%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abntbibufjf}[2020/11/28 v 2.1]


\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{memoir}
}
\ProcessOptions\relax
\LoadClass[12pt,a4paper]{memoir}

%------------------------------------

\RequirePackage{ifthen}
\RequirePackage[brazil]{babel}
\RequirePackage{enumitem}
\RequirePackage{calc} 


\newcommand{\IfNonempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}} 

\RequirePackage[hypertexnames=false, hidelinks]{hyperref}    

\pdfstringdefDisableCommands{
\def\url{}
\def\cite\@gobble 
\let\textcolor\@gobble
}

\RequirePackage{bookmark}   			


\newcommand{\folhaderostoname}{Folha de rosto}
\newcommand{\dedicatorianame}{Dedicat\'oria}
\newcommand{\agradecimentosname}{\bfseries AGRADECIMENTOS}
\newcommand{\epigraphname}{Ep\'igrafe}
\newcommand{\orientadorname}{Orientador:}
\newcommand{\coorientadorname}{Coorientador:}
\newcommand{\folhadeaprovacaoname}{\bfseries FOLHA DE APROVA\c{C}\~AO}
\newcommand{\resumoname}{RESUMO} 
\newcommand{\listadesimbolosname}{\bfseries LISTA DE S\'IMBOLOS}
\newcommand{\listadesiglasname}{\bfseries LISTA DE ABREVIATURAS E SIGLAS}
\newcommand{\anexoname}{\bfseries ANEXO}
\newcommand{\anexosname}{Anexos}
\newcommand{\apendicename}{\bfseries AP\^ENDICE}
\newcommand{\apendicesname}{Ap\^endices}

%% --
\addto\captionsbrazil{
  \renewcommand{\contentsname}{\bfseries SUM\'ARIO} 
  \renewcommand{\bibname}{\bfseries REFER\^ENCIAS}
  \renewcommand{\indexname}{\bfseries \'INDICE}
  \renewcommand{\listfigurename}{\bfseries LISTA DE ILUSTRA\c{C}\~{O}ES}
  \renewcommand{\listtablename}{\bfseries LISTA DE TABELAS}
}

%% ----------------------------

\def\au@classname{abntbibufjf} 

\newif\if@eu@ilhookcalled\@eu@ilhookcalledfalse
\newif\if@eu@hasil\@eu@hasilfalse

\def\au@eu@ilaux{\global\@eu@hasiltrue}
\def\au@eu@ilhook{%
  \if@eu@ilhookcalled\else
    \global\@eu@ilhookcalledtrue
    \global\@eu@hasiltrue
    \immediate\write\@auxout{%
      \string\au@eu@ilaux{}^^J
    }
    \typeout{* \au@classname: Il }%
  \fi
}
\newcommand{\auaddilcmd}[1]{%
  \begingroup
  \let\au@temp#1
  \expandafter\gdef\expandafter#1\expandafter{%
    \expandafter\au@eu@ilhook\au@temp}
  \endgroup
}
\newcommand{\auaddilenv}[1]{%
  \begingroup
  \expandafter\auaddilcmd\expandafter{\csname#1\endcsname}
  \endgroup
}
\AtBeginDocument{\auaddilenv{figure}}

%------------------------------------

\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout

\OnehalfSpacing
\AtBeginDocument{\setlength{\afterchapskip}{\onelineskip}} 

\setlength{\parindent}{1.3cm}
\setlength{\parskip}{4pt}
\setlength{\cftbeforechapterskip}{0pt} 

%-----------------------------------

\newcounter{bookmarkcounter} 
\setcounter{bookmarkcounter}{0}
\newcommand{\bookmarkphantom}[1]{%
  \addtocounter{bookmarkcounter}{1}%
  \phantomsection\pdfbookmark[0]{#1}{chapterb\arabic{bookmarkcounter}}
}

\newcommand{\pretextualchapter}[1]{%
  \addtocounter{bookmarkcounter}{1}%
  \bookmarkphantom{#1}
  \chapter*[#1]{#1}
  }
\provideboolean{AppendixAnexo}      
\setboolean{AppendixAnexo}{false}


%------------------------------------

\renewcommand{\foottextfont}{\small}
\setlength{\footmarkwidth}{1.2em}
\setlength{\footmarksep}{0em}
\footmarkstyle{\footnotesize{\textsuperscript{#1}}\hfill}

  \counterwithout{figure}{chapter}
  \counterwithout{table}{chapter}

%------------------------------------

\captiondelim{~\textendash ~} 
\captionnamefont{\normalsize}
\captiontitlefont{\normalsize}
\indentcaption{0pt} 
\captionstyle[\centering]{\centerlastline} 
\newcommand{\larguratexto}{\changecaptionwidth \captionwidth} 

\newcommand{\configureseparator}{\captiondelim{: }}

\newcommand{\fonte}[2][Fonte]{%
  \M@gettitle{#2}
  \memlegendinfo{#2}
  \par
  \begingroup
  \captionstyle{\raggedright}{\raggedright} 
     \@parboxrestore
     \if@minipage
       \@setminipage
     \fi
     \small
     \captiondelim{: }
     \@makecaption{\small 
     #1}{\ignorespaces \small 
     #2}\par
   \endgroup}

\newcommand{\nota}[2][Nota]{
  \vspace*{-12pt }
  \M@gettitle{#2}
  \memlegendinfo{#2}
  \par
  \begingroup
  \captionstyle{\raggedright}{\raggedright} 
     \@parboxrestore
     \if@minipage
       \@setminipage
     \fi
     \small
     \captiondelim{: }
     \@makecaption{\small 
     #1}{\ignorespaces \small 
     #2}\par
   \endgroup}   


\AtEndPackage{caption}{
  \AtBeginDocument{
    \DeclareCaptionLabelSeparator{dash}{~\textendash ~}
    \DeclareCaptionFont{normalsize}{\normalsize}
      \captionsetup{
                    labelseparator=dash,
                    }
      \renewcommand{\configurecaptions}{
                  \captionsetup{
                                singlelinecheck=false}}
      \renewcommand{\configureseparator}{\captionsetup{labelsep=colon}}
  }
}

%------------------------------------

\setsecnumdepth{paragraph}
\settocdepth{paragraph}
\setcounter{tocdepth}{5}
\setcounter{secnumdepth}{5}
\maxsecnumdepth{paragraph}

\newcommand{\subsubsubsection}{\paragraph}
\newcommand{\cftbeforesubsubsubsectionskip}{\cftbeforeparagraphskip}

\newcommand{\setsubsubsubsecheadstyle}{\setparaheadstyle}

\setafterparaskip{1.0\onelineskip plus 0.5\onelineskip minus 0.2\onelineskip}
\setparaheadstyle{\normalfont
\raggedright
} 

\renewcommand{\thesubsection}{\textbf{{\thesection}.\arabic{subsection}}}

\renewcommand{\thesubsubsection}
{\textit
{{\thesection}.\arabic{subsection}.\arabic{subsubsection}}}

\renewcommand{\theparagraph}
{{\thesection}.\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}}


%------------------------------------

\setrmarg{0em} 

\renewcommand{\cftfigurename}{\figurename\space} 
\renewcommand*{\cftfigureaftersnum}{\hfill \textendash \hfill} 
\renewcommand{\cftfigureafterpnum}{\cftparfillskip} 

\newcommand{\tipoilust}[1]{\renewcommand{\cftfigurename}{#1 \space}
\renewcommand{\figurename}{#1}
}

\newcommand{\ilustvaria}{
\renewcommand{\fnum@figure}{} 
}

\newcommand{\listilustvaria}{
\setlength{\cftfigurenumwidth}{24pt}
\setlength{\cftfigureindent}{0pt}
\begingroup
\renewcommand\numberline[1]{} 
\listoffigures*
\endgroup
}

\renewcommand{\cfttablename}{\tablename\space}
\renewcommand*{\cfttableaftersnum}{\hfill \textendash \hfill}	
\renewcommand{\cfttableafterpnum}{\cftparfillskip} 


\renewcommand*{\cftchapterdotsep}{\cftdotsep}

\setlength{\cftbeforechapterskip}{0pt plus 0pt}
\renewcommand*{\insertchapterspace}{}

\newlength{\cftlastnumwidth}
\setlength{\cftlastnumwidth}{\cftsubsubsectionnumwidth+1em}

\newcommand{\tocprintchapter}{}
\newcommand{\tocinnonumchapter}{}
\newcommand{\tocprintchapternonum}{}

\cftinsertcode{AAA}{\renewcommand{\cftchapteraftersnum}{\hfill \textendash \hfill \flushleftright}}
  
\cftsetindents{part}{0em}{\cftlastnumwidth}
\cftsetindents{chapter}{0em}{\cftlastnumwidth}
\cftsetindents{section}{0em}{\cftlastnumwidth}
\cftsetindents{subsection}{0em}{\cftlastnumwidth}
\cftsetindents{subsubsection}{0em}{\cftlastnumwidth}
\cftsetindents{paragraph}{0em}{\cftlastnumwidth}
\cftsetindents{subparagraph}{0em}{\cftlastnumwidth}
  
\renewcommand{\tocprintchapter}{
    \addtocontents{toc}{\cftsetindents{chapter}{0em}{\cftlastnumwidth}}}
  
\renewcommand{\tocinnonumchapter}{
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}
    \cftinserthook{toc}{AAA}}
  
\renewcommand{\tocprintchapternonum}{
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}}
  
%------------------------------------

\setsecheadstyle{\normalsize \flushleftright}
\setsubsecheadstyle{\normalsize \flushleftright}
\setsubsubsecheadstyle{\normalsize \flushleftright}
\setsubsubsubsecheadstyle{\normalsize \flushleftright}

\provideboolean{innonumchapter}  
\setboolean{innonumchapter}{true}
\makechapterstyle{abntufjf}{%
  \renewcommand*{\chapterheadstart}{} 
  \renewcommand*{\chapternamenum}{}
  \renewcommand*{\afterchapternum}{}
  \renewcommand*{\midchapskip}{} 
  
\setlength{\beforechapskip}{0pt}
    
\renewcommand{\printchaptername}{
   \ifthenelse{\boolean{AppendixAnexo}}
   {}{}
  }
  
  \def\printchaptertitle##1{%
   \ifthenelse{\boolean{innonumchapter}}{
    \centering
    {##1}}{%
    \ifthenelse{\boolean{AppendixAnexo}}{
      \centering
        {##1}
      }{%
       \flushleftright 
        \hfill
          \parbox[t]{\textwidth-36pt}
           {
        {##1}}}
    }    
  }
       
\renewcommand{\printchapternum}{
     \tocprintchapter
     \setboolean{innonumchapter}{false}
     \bfseries 
     \space\thechapter\space%
     \ifthenelse{\boolean{AppendixAnexo}}{
     }{} 
  }
  
    
\renewcommand\printchapternonum{
\tocprintchapternonum
\setboolean{innonumchapter}{true}
}
}

\chapterstyle{abntufjf}
\makepagestyle{abntufjfchapfirst}
\makeoddhead{abntufjfchapfirst}{}{}{\normalsize\thepage}


%------------------------------------

\newcommand{\pretextual}{
  \aliaspagestyle{chapter}{empty}
  \pagestyle{empty}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{empty}
}
\renewcommand{\frontmatter}{\pretextual} 

\AtBeginDocument{\pretextual}

%------------------------------------


\newcommand{\titulo}[1]{\title{#1}}
\newcommand{\inseretitulo}{\thetitle}

\newcommand{\autor}[1]{\author{#1}}
\newcommand{\insereautor}{\theauthor}

\let\olddate\date
\renewcommand{\date}[1]{\AtBeginDocument{\olddate{#1}}}
\newcommand{\data}[1]{\date{#1}}
\newcommand{\inseredata}{\thedate}

\providecommand{\insereinstituicao}{}
\newcommand{\instituicao}[1]{\renewcommand{\insereinstituicao}{#1}}

\providecommand{\inserefaculdade}{}
\newcommand{\faculdade}[1]{\renewcommand{\inserefaculdade}{#1}}

\providecommand{\inserelocal}{}
\newcommand{\local}[1]{\renewcommand{\inserelocal}{#1}}

\providecommand{\inserenatureza}{}
\newcommand{\natureza}[1]{\renewcommand{\inserenatureza}{#1}}

\providecommand{\insereobjeto}{}
\newcommand{\objeto}[1]{\renewcommand{\insereobjeto}{#1}}

\providecommand{\insereprograma}{}
\newcommand{\programa}[1]{\renewcommand{\insereprograma}{#1}}

\providecommand{\inseresubtitulo}{}
\newcommand{\subtitulo}[1]{\renewcommand{\inseresubtitulo}{#1}}

\providecommand{\inserefinalcatalog}{}
\newcommand{\finalcatalog}[1]{\renewcommand{\inserefinalcatalog}{#1}}

\providecommand{\insereautorVirg}{}
\newcommand{\autorVirg}[1]{\renewcommand{\insereautorVirg}{#1}}

\providecommand{\insereorientadorOU}{}
\providecommand{\insereorientador}{}
\newcommand{\orientador}[2][\orientadorname]
  {\renewcommand{\insereorientadorOU}{#1}
   \renewcommand{\insereorientador}{#2}}

\providecommand{\inserecoorientadorOU}{}
\providecommand{\inserecoorientador}{}
\newcommand{\coorientador}[2][\coorientadorname]
  {\renewcommand{\inserecoorientadorOU}{#1}
   \renewcommand{\inserecoorientador}{#2}}
   
\providecommand{\insereorientadorTitulo}{}
\newcommand{\orientadorTitulo}[1]{\renewcommand{\insereorientadorTitulo}{#1}}
   
\providecommand{\inserecoorientadorTitulo}{}
\newcommand{\coorientadorTitulo}[1]{\renewcommand{\inserecoorientadorTitulo}{#1}}   
   

%------------------------------------

\newenvironment{capa}{\begin{titlingpage}}{\end{titlingpage}\cleardoublepage}

\newcommand{\inserecapa}{
  \begin{capa}
   \begin{center}
    {
    \bfseries \MakeUppercase{\insereinstituicao} \par \MakeUppercase{\inserefaculdade} \par \MakeUppercase{\insereprograma}}
    \vfill
    {
    \bfseries \insereautor}
    \vfill
    {\bfseries \inseretitulo \mdseries \IfNonempty{\inseresubtitulo}{\textbf{:} \inseresubtitulo}}
    \vfill
    \inserelocal \par \inseredata 
   \end{center}
   \end{capa}
}

\newenvironment{folhaderosto}[1][\folhaderostoname]{\clearpage\bookmarkphantom{#1}}{\newpage}

%% --
\newcommand{\folhaderostocont}{
  \begin{center}
    {
    \bfseries \insereautor} 
    \vspace*{\fill}
    \begin{center}
      {
      \bfseries \inseretitulo \mdseries 
        \IfNonempty{\inseresubtitulo}{\textbf{:} \inseresubtitulo}}
    \end{center}
    \vspace*{\fill}
      \IfNonempty{\inserenatureza}{
      \hspace{.45\textwidth}
      \begin{minipage}{.5\textwidth}
      	\SingleSpacing
         \inserenatureza
      \end{minipage}
       \vspace*{\fill}
    }
  \end{center} 
   {\insereorientadorOU ~\insereorientadorTitulo ~\insereorientador \par }
    \IfNonempty{\inserecoorientador}{
       {\inserecoorientadorOU ~\inserecoorientadorTitulo ~\inserecoorientador}
    }
    \vfill
  \begin{center}  
    \inserelocal \par \inseredata   
  \end{center}
}

%% --

\newcommand{\inserefolhaderosto}[1]{
  \begin{folhaderosto}{#1}
     \folhaderostocont
  \end{folhaderosto}}

%% --
\newcommand{\inserecatalog}{
\thispagestyle{empty}

\ifthenelse{\boolean{@twoside}}
{}
{\addtocounter{page}{-1}}

{
\vspace*{15cm}
\begin{center}
\begin{minipage}[c]{13cm}
\begin{center}
Ficha catalogr\'afica elaborada atrav\'es do Modelo Latex do CDC da UFJF com os dados fornecidos pelo(a) autor(a)
\end{center}
\end{minipage}

\fbox{\hspace*{0.3cm} \begin{minipage}[c]{12.5cm} \SingleSpacing \small
  \insereautorVirg . \par
  \hspace*{0.45cm} \inseretitulo \IfNonempty{\inseresubtitulo}{ : \inseresubtitulo} ~/ \insereautor. \textendash ~\inseredata .\par
  \hspace*{0.5cm} \pageref{LastPage} f. \if@eu@hasil : il.~\fi \\[12pt]
  \hspace*{0.45cm} \insereorientadorOU ~\insereorientador \par
    {\IfNonempty{\inserecoorientador}{%
       {\hspace*{0.45cm} \inserecoorientadorOU ~\inserecoorientador \par }%
    }
   }
  \hspace*{0.45cm} \insereobjeto ~\textendash ~\insereinstituicao , \inserefaculdade . \insereprograma , \inseredata . \\[12pt]
  \hspace*{0.5cm}  \inserefinalcatalog 
  \vspace*{12pt}
  \hspace*{0.3cm}
\end{minipage} \hspace*{0.3cm}}
\end{center}}
}

\newcommand{\inicfolhaaprov}{
\begin{center}
    {
    \bfseries \insereautor}

    \vfill
    \begin{center}
      {
      \bfseries\inseretitulo \mdseries \IfNonempty{\inseresubtitulo}{\textbf{:} \inseresubtitulo}}
    \end{center}
    \vfill
    
    \hspace{.45\textwidth}
    \begin{minipage}{.5\textwidth}
        \inserenatureza
    \end{minipage}%
    \vfill
   \end{center}
}

%%%
    
\newenvironment{folhadeaprovacao}[1][\folhadeaprovacaoname]{
   \clearpage
   \bookmarkphantom{#1}
   \begin{Spacing}{1.0}
}{\end{Spacing}
\cleardoublepage}

\newenvironment{dedicatoria}[1][]{
   \ifthenelse{\equal{#1}{}}{
    \bookmarkphantom{\dedicatorianame}
    }{\pretextualchapter{#1}}
    \vspace*{\fill} 
    \begin{quote}
    \addtolength{\leftskip}{4cm}
  }{
    \end{quote}
  \cleardoublepage}
  
\newenvironment{agradecimentos}[1][\agradecimentosname]{
   \pretextualchapter{#1}
  }{
  \cleardoublepage}
  
\newenvironment{epigrafemenos}[1][]{
   \ifthenelse{\equal{#1}{}}{
    \bookmarkphantom{\epigraphname}
    }{\pretextualchapter{#1}}
    \vspace*{\fill}
    \noindent 
    }{
    \cleardoublepage} 
    
\newenvironment{epigrafemais}[1][]{
   \ifthenelse{\equal{#1}{}}{
    \bookmarkphantom{\epigraphname}
    }{\pretextualchapter{#1}}
    \vspace*{\fill}
    \begin{citacao}{}}
    {\end{citacao}  \cleardoublepage}
  
  
\setlength\absleftindent{0cm}
\setlength\absrightindent{0cm}
  
\renewcommand{\abstracttextfont}{\normalsize}

\newenvironment{resumo}[1][\resumoname]{
   \bookmarkphantom{#1}
   \renewcommand{\abstractname}{\bfseries 
   {#1}}
   \begin{abstract}
  }{\end{abstract}
\cleardoublepage}


\newenvironment{siglas}{
  \pretextualchapter{\listadesiglasname}
  \begin{symbols} 
  \setlength{\itemsep}{-0.5em} 
  }{
  \end{symbols}
  \cleardoublepage
  }

\newenvironment{simbolos}{
  \pretextualchapter{\listadesimbolosname}
\begin{symbols} 
\setlength{\itemsep}{-0.5em} 
}{
\end{symbols}
  \cleardoublepage
}

\newenvironment*{citacao}
{
   \list{}
   \small
   \addtolength{\leftskip}{4cm}
   \item[]
   \begin{SingleSpace}
   }
 {
   \end{SingleSpace}
   \endlist}

%% --
\newlist{alineas}{enumerate}{1}
\setlist[alineas,1]{label={\alph*)},topsep=0pt,itemsep=0pt,leftmargin=\parindent+\labelwidth-\labelsep}

\newlist{subalineas}{enumerate}{1}
\setlist[subalineas,1]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}
%% --
  
\newlength{\signwidth} 
\setlength{\signwidth}{10cm} 
\newlength{\signthickness} 
\setlength{\signthickness}{1pt}
\newlength{\signskip} 
\setlength{\signskip}{1cm} 
  
\newcommand{\assinatura}[1]{
  \begingroup\par\centering 
  \parbox[t]
  {\signwidth}{\SingleSpacing\vspace*{\signskip}\centering
  \rule{\signwidth}{\signthickness}\\
  \nopagebreak #1\par}
  \par\endgroup}

%------------------------------------

\newcommand{\textual}{
    \pagestyle{simple} 
    \aliaspagestyle{chapter}{abntufjfchapfirst}
  \nouppercaseheads
  \bookmarksetup{startatroot}
\aliaspagestyle{cleared}{simple} 
  }
\renewcommand{\mainmatter}{\textual}

%------------------------------------

\newcommand{\postextual}{\bookmarksetup{startatroot}
  \phantomsection 
  }
  
\renewcommand{\backmatter}{\postextual}

%---
   
\renewcommand{\@biblabel}[1]{#1}  
\AtBeginDocument{
\let\oldthebibliography\thebibliography
\let\endoldthebibliography\endthebibliography
\renewenvironment{thebibliography}[1]{%
\setlength{\bibhang}{0pt}
\setlength{\afterchapskip}{\lineskip}
\raggedright
\begin{oldthebibliography}{#1}
\begin{SingleSpace}
}
{
\end{SingleSpace}
\end{oldthebibliography}
}
}

%%---

\newcommand\@switch[1]{ \@writefile{toc}
{\renewcommand*{\cftappendixname}{%
}} }
\newcommand{\switchchapname}[1]{ \protected@write \@auxout {}{\string\@switch{#1} }}

\newcommand{\apendiceanexoformato}[2]{%
 \setboolean{AppendixAnexo}{true}
 \renewcommand{\appendixname}{#1}
 \renewcommand{\appendixpagename}{#2}
 \switchchapname{#1}
 \renewcommand*{\cftappendixname}{%
 }
}

 
\newenvironment{apendices}{
\apendiceanexoformato{}
{\apendicesname}
\newcommand{\apendseq}{\apendicename \space \Alph{chapter}\space \textendash ~}
\begin{appendix}
 \renewcommand*{\thechapter}{}
 }{
 \end{appendix}
\setboolean{AppendixAnexo}{false}
\bookmarksetup{startatroot}
}
 
\newenvironment{anexos}{
\apendiceanexoformato{}
{\anexosname} 
\newcommand{\anexoseq}{\anexoname \space \Alph{chapter}\space \textendash ~}
\begin{appendix}
\renewcommand*{\thechapter}{}
}{
 \end{appendix}
 \setboolean{AppendixAnexo}{false}
 \bookmarksetup{startatroot}
}


% ---
% --- 

