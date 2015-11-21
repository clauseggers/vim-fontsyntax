" Vim syntax file
" Language: 			 OpenType Feature
" Maintainer: 		 Claus Eggers Sørensen <clauses@gmail.com>
" URL: 						 http://www.github.com/clauseggers/vim-fontsyntax
" Version: 				 0.01
" Latest Revision: 6 July 2015


" LOADER
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Clear a loaded syntax (if any). Useful when developing a theme.
" SymLink your syntax file to the `~/.vim/syntax` directory.
" Load the syntax file by entering `:set syntax=fea`
syntax clear

" Set global option to match case (can be overridden locally)
syntax case match

" Include non-standard (in the eyes of Vim) keywords
setlocal iskeyword+=-
setlocal iskeyword+=/

" Comments structure
syntax region feaComment start="#" end="$"

" Line terminations
syntax match feaDelimiter ";"

" Set very large synchonising parsing range
" syntax sync minlines=150 maxlines=1500
syntax sync minlines=999

" Set unlimited columns (to highlight very long lines)
set synmaxcol=0

" Reserved OpenType feature keywords
syntax case match
syntax keyword feaReserved contained anchorDef anonymous anon by contour cursive device enumerate enum exclude_dflt feature from ignore IgnoreBaseGlyphs IgnoreLigatures IgnoreMarks MarkAttachmentType UseMarkFilteringSet include include_dflt language languagesystem lookup lookupflag mark nameid NULL parameters position pos required RightToLeft reversesub rsub script substitute sub subtable table useExtension valueRecordDef 

" Special highlighting for the single-quote
syntax match feaReservedSingleQuote "\>'"
syntax match feaReservedSingleQuote "' "
syntax match feaReservedSingleQuote "';"


" COMMON FEATURE KEYWORDS AND STRUCTURES
" Braces structure
syntax region feaCurlyBraces matchgroup=feaCurlyBraces start="{" end="}" contains=feaLookup,feaScript,feaSubtableRegion,feaReserved,feaFeature

" GSUB (Substitution)
syntax keyword feaSub contained sub[stitute] 

" GPOS (Position)
syntax keyword feaPos contained pos[ition] 

" Anchors
syntax keyword feaAnchorKeyword contained anchor
syntax region feaAnchorGroup matchgroup=feaAnchorChevrons start="<" end=">" contains=feaAnchorKeyword,feaInteger

" Glyph names are matched but not highlighted
syntax match feaGlyph "@\=[A-Za-z0-9_-]\+\(\.\)\=[A-Za-z0-9_-]\="

" markClass
syntax keyword feaMarkClassKeyword contained markClass
syntax region feaMarkClass start="\<markClass" end="\ze;" skipwhite contains=feaGroup,feaAnchorGroup,feaReserved,feaDelimiter

" INTEGERS
" First find zeros (Must not have preceding minus nor zero).
syntax match feaInteger "\(\.\@<!\a\@<!\d\@<!-\@<!\)\(0\{1}\)\>" contained
" Then find other positive and negative integers
syntax match feaInteger "\(\.\@<!\w\@<!\)\(-\?[1-9]\+[0-9]*\)" contained

" Glyph groups
syntax region feaGroup matchgroup=feaSquareBrackets start="\[" end="\]"
syntax match feaGroup "@[A-Za-z_]\{1}[A-Za-z0-9._-]\{0,29}"
syntax match feaGroupEqual "="


" LANGUAGE SYSTEMS GRAMMAR
syntax keyword feaLanguagesystemNotContained languagesystem
syntax region feaLanguagesystem start="\<languagesystem" end="\ze " contains=feaLanguagesystemScript skipwhite nextgroup=feaLanguagesystemScript
syntax region feaLanguagesystemScript matchgroup=feaScript start="DFLT\|arab\|armn\|avst\|bali\|bamu\|batk\|beng\|bng2\|bopo\|brai\|brah\|bugi\|buhd\|byzm\|cans\|cari\|cakm\|cham\|cher\|hani\|copt\|cprt\|cyrl\|dsrt\|deva\|dev2\|egyp\|ethi\|geor\|glag\|goth\|grek\|gujr\|gjr2\|guru\|gur2\|hang\|jamo\|hano\|hebr\|kana\|armi\|phli\|prti\|java\|kthi\|knda\|knd2\|kana\|kali\|khar\|khmr\|lao\|latn\|lepc\|limb\|linb\|lisu\|lyci\|lydi\|mlym\|mlm2\|mand\|math\|mtei\|merc\|mero\|mong\|musc\|mymr\|mym2\|talu\|nko\|ogam\|olck\|ital\|xpeo\|sarb\|orkh\|orya\|ory2\|osma\|phag\|phnx\|rjng\|runr\|samr\|saur\|shrd\|shaw\|sinh\|sora\|xsux\|sund\|sylo\|syrc\|tglg\|tagb\|tale\|lana\|tavt\|takr\|taml\|tml2\|telu\|tel2\|thaa\|thai\|tibt\|tfng\|ugar\|vai\|yi" end=" " nextgroup=feaLanguage

" Scripts
syntax case match
syntax keyword feaScript contained DFLT arab armn avst bali bamu batk beng bng2 bopo brai brah bugi buhd byzm cans cari cakm cham cher hani copt cprt cyrl dsrt deva dev2 egyp ethi geor glag goth grek gujr gjr2 guru gur2 hang jamo hano hebr kana armi phli prti java kthi knda knd2 kana kali khar khmr lao latn lepc limb linb lisu lyci lydi mlym mlm2 mand math mtei merc mero mong musc mymr mym2 talu nko ogam olck ital xpeo sarb orkh orya ory2 osma phag phnx rjng runr samr saur shrd shaw sinh sora xsux sund sylo syrc tglg tagb tale lana tavt takr taml tml2 telu tel2 thaa thai tibt tfng ugar vai yi

" Languages (OpenType specification, not ISO 639-2)
syntax case match
syntax keyword feaLanguage contained dflt ABA ABK ADY AFK AFR AGW ALS ALT AMH ARA ARI ARK ASM ATH AVR AWA AYM AZE BAD BAG BAL BAU BBR BCH BCR BEL BEM BEN BGR BHI BHO BIK BIL BKF BLI BLN BLT BMB BML BOS BRE BRH BRI BRM BSH BTI CAT CEB CHE CHG CHH CHI CHK CHP CHR CHU CMR COP COS CRE CRR CRT CSL CSY DAN DAR DCR DEU dflt DGR DIV DJR DNG DNK DRI DUN DZN EBI ECR EDO EFI ELL ENG ERZ ESP ETI EUQ EVK EVN EWE FAN FAR FIN FJI FLE FNE FON FOS FRA FRI FRL FTA FUL GAD GAE GAG GAL GAR GAW GEZ GIL GMZ GON GRN GRO GUA GUJ HAI HAL HAR HAU HAW HBN HIL HIN HMA HND HO HRI HRV HUN HYE IBO IJO ILO IND ING INU IRI IRT ISL ISM ITA IWR JAV JII JAN JUD JUL KAB KAC KAL KAN KAR KAT KAZ KEB KGE KHA KHK KHM KHS KHV KHW KIK KIR KIS KKN KLM KMB KMN KMO KMS KNR KOD KOH KOK KON KOP KOR KOZ KPL KRI KRK KRL KRM KRN KRT KSH KSI KSM KUI KUL KUM KUR KUU KUY KYK LAD LAH LAK LAM LAO LAT LAZ LCR LDK LEZ LIN LMA LMB LMW LSB LSM LTH LTZ LUB LUG LUH LUO LVI MAJ MAK MAL MAN MAP MAR MAW MBN MCH MCR MDE MEN MIZ MKD MLE MLG MLN MLR MLY MND MNG MNI MNK MNX MOH MOK MOL MON MOR MRI MTH MTS MUN NAG NAN NAS NCR NDB NDG NEP NEW NGR NHC NIS NIU NKL NKO NLD NOG NOR NSM NTA NTO NYN OCI OCR OJB ORI ORO OSS PAA PAL PAN PAP PAS PGR PIL PLG PLK PRO PTG QIN RAJ RCR RBU RIA RMS ROM ROY RSY RUA RUS SAD SAN SAT SAY SEK SEL SGO SHN SIB SID SIG SKS SKY SLA SLV SML SMO SNA SND SNH SNK SOG SOT SQI SRB SRK SRR SSL SSM SUR SVA SVE SWA SWK SWZ SXT SYR TAB TAJ TAM TAT TCR TEL TGN TGR TGY THA THT TIB TKM TMN TNA TNE TNG TOD TRK TSG TUA TUL TUV TWI UDM UKR URD USB UYG UZB VEN VIT WA WAG WCR WEL WLF XBD XHS YAK YBA YCR YIC YIM ZHH ZHP ZHS ZHT ZND ZUL 


" LOOKUP GRAMMAR
syntax region feaLookup start="\<lookup" end="\ze{" contains=feaLookupRegion skipwhite skipnl nextgroup=feaLookupRegion 
syntax region feaLookupRegion transparent skipwhite skipnl matchgroup=feaCurlyBraces start="{" end="}" contains=feaReserved,feaInteger,feaScript,feaLanguage,feaGroup,feaGroupEqual,feaSub,feaPos,feaTag,feaSubtableRegion,feaAnchorGroup,feaComment,feaReservedSingleQuote,feaDelimiter fold


" FEATURES GRAMMAR
syntax match feaFeature "\<feature" nextgroup=feaTag skipwhite

" Registered GSUB and/or GPOS OpenType feature tags
syntax case ignore
syntax keyword feaTag contained aalt abvf abvm abvs afrc akhn blwf blwm blws calt case ccmp cfar cjct clig cpct cpsp cswh curs c2pc c2sc dist dlig dnom dtls expt falt fin2 fin3 fina flac frac fwid half haln halt hist hkna hlig hngl hojo hwid init isol ital jalt jp78 jp83 jp90 jp04 kern lfbd liga ljmo lnum locl ltra ltrm mark med2 medi mgrk mkmk mset nalt nlck nukt numr onum opbd ordn ornm palt pcap pkna pnum pref pres pstf psts pwid qwid rand rclt rkrf rlig rphf rtbd rtla rtlm ruby salt sinf size smcp smpl ssty stch subs sups swsh titl tjmo tnam tnum trad twid unic valt vatu vert vhal vjmo vkna vkrn vpal vrt2 zero 
syntax match feaTag "\(cv[0-9][1-9]\)\|\(cv[1-9][0-9]\)" contained
syntax match feaTag "\(ss0[1-9]\)\|\(ss1[0-9]\)\|ss20" contained

" Features
syntax region feaFeature start="\<feature" end="\ze{" contains=feaTag skipwhite skipnl nextgroup=feaFeatureRegion
syntax region feaFeatureRegion transparent skipwhite skipnl matchgroup=feaCurlyBraces start="{" end="}" contains=feaReserved,feaScript,feaLanguage,feaTag,feaGroup,feaGroupEqual,feaLookup,feaLookupRegion,feaInteger,feaReservedSingleQuote,feaSubtableRegion,feaAnchorGroup,feaComment,feaDelimiter fold nextgroup=feaTag

" Feature AALT
syntax keyword feaAALTKeyword contained aalt
syntax region feaFeatureAALT start="\<feature aalt" end="\ze{" contains=feaAALTKeyword skipwhite skipnl nextgroup=feaAALT
syntax keyword feaFEATUREKeyword contained feature
syntax region feaAALT transparent skipwhite skipnl matchgroup=feaCurlyBraces start="{" end="}"  contains=feaFEATUREKeyword,feaTag,feaDelimiter fold nextgroup=feaAALTKeyword

" Feature CPSP
syntax keyword feaCPSPKeyword contained cpsp
syntax region feaFeatureCPSP start="\<feature cpsp" end="\ze{" contains=feaCPSPKeyword skipwhite skipnl nextgroup=feaCPSP
syntax region feaCPSP transparent skipwhite skipnl matchgroup=feaCurlyBraces start="{" end="}"  contains=feaPos,feaGroup,feaCPSPRegion,feaDelimiter fold nextgroup=feaCPSPKeyword
syntax region feaCPSPRegion matchgroup=feaAnchorChevrons start="<" end=">" contains=feaAnchorGroup,feaInteger fold 

" Subtables
syntax keyword feaSubtable contained sub[table] 
syntax region feaSubtableRegion contained start="subtable;\n" end="subtable;" skipwhite skipnl contains=feaSub,feaPos,feaSubtableRegion fold nextgroup=feaSub,feaPos,feaLookup

" TABLES GRAMMAR
" Tables
syntax case match
syntax keyword feaTableName acnt avar BASE bdat BDF bhed bloc bsln CFF cmap cvar cvt DSIG EBDT EBLC EBSC fdsc Feat feat FFTM fmtx fpgm fvar gasp GDEF Glat Gloc glyf GPOS GSUB gvar hdmx head hhea hmtx hsty JSTF just kern lcar loca LTHS maxp mort morx name opbd OS/2 PCLT PfEd post prep prop Silf TeX trak VDMX vhea vmtx VORG Zapf contained 

" Table strings
syntax region feaTableString matchgroup=feaStringDblQuote start=/"/ skip=/\\"/ end=/"/ contains=feaTableStringEscaped

" Escaped characters in strings
syntax match feaTableStringEscaped "\(\\[0-9A-F]\{4}\)\|\(\\[0-9A-F]\{2}\)" contained

" BASE table
syntax region feaTable start="\<table base" end="\ze{" contains=feaTableName skipwhite skipnl nextgroup=feaTableBASERegion
syntax region feaTableBASERegion transparent skipwhite skipnl matchgroup=feaCurlyBraces start="{" end="}" contains=feaTableBASE,feaInteger,feaDelimiter fold nextgroup=feaTableName
syntax keyword feaTableBASE contained HorizAxis\.BaseTagList HorizAxis\.BaseScriptList HorizAxis\.MinMax VertAxis\.BaseTagList VertAxis\.BaseScriptList VertAxis\.MinMax 

" GDEF table
syntax region feaTable start="\<table GDEF" end="\ze{" contains=feaTableName skipwhite skipnl nextgroup=feaTableGDEFRegion
syntax region feaTableGDEFRegion transparent skipwhite skipnl matchgroup=feaCurlyBraces start="{" end="}" contains=feaTableGDEF,feaGroup,feaInteger,feaComment,feaDelimiter fold nextgroup=feaTableName
syntax keyword feaTableGDEF contained GlyphClassDef Attach LigatureCaretByDev LigatureCaretByIndex LigatureCaretByPos MarkAttachClass 

" HEAD table
syntax region feaTable start="\<table head" end="\ze{" contains=feaTableName skipwhite skipnl nextgroup=feaTableHEADRegion
syntax region feaTableHEADRegion transparent skipwhite skipnl matchgroup=feaCurlyBraces start="{" end="}" contains=feaTableHEAD,feaInteger,feaVersion,feaDelimiter fold nextgroup=feaTableName
syntax match feaVersion contained "\(\d\{2}[1-9]\|\d[1-9]\d\|[1-9]\d\{2}\)\.\d\{3}" contained
syntax keyword feaTableHEAD contained FontRevision 

" HHEA table
syntax region feaTable start="\<table hhea" end="\ze{" contains=feaTableName skipwhite skipnl nextgroup=feaTableHHEARegion
syntax region feaTableHHEARegion transparent skipwhite skipnl matchgroup=feaCurlyBraces start="{" end="}" contains=feaTableHHEA,feaInteger,feaDelimiter fold nextgroup=feaTableName
syntax keyword feaTableHHEA contained CaretOffset Ascender Descender LineGap 

" SIZE table
syntax region feaTable start="\<table size" end="\ze{" contains=feaTableName skipwhite skipnl nextgroup=feaTableSIZERegion
syntax region feaTableSIZERegion transparent skipwhite skipnl matchgroup=feaCurlyBraces start="{" end="}" contains=feaTableSIZE,feaInteger,feaDelimiter fold nextgroup=feaTableName
syntax keyword feaTableSIZE contained sizemenuname

" VHEA table
syntax region feaTable start="\<table VHEA" end="\ze{" contains=feaTableName skipwhite skipnl nextgroup=feaTableVHEARegion
syntax region feaTableVHEARegion transparent skipwhite skipnl matchgroup=feaCurlyBraces start="{" end="}" contains=feaTableVHEA,feaInteger,feaDelimiter fold nextgroup=feaTableName
syntax keyword feaTableVHEA contained VertTypoAscender VertTypoDescender VertTypoLineGap

" VMTX table
syntax region feaTable start="\<table VMTX" end="\ze{" contains=feaTableName skipwhite skipnl nextgroup=feaTableVMTXRegion
syntax region feaTableVMTXRegion transparent skipwhite skipnl matchgroup=feaCurlyBraces start="{" end="}" contains=feaTableVMTX,feaInteger,feaDelimiter fold nextgroup=feaTableName
syntax keyword feaTableVMTX contained VertOriginY VertAdvanceY 

" NAME table
syntax region feaTable start="\<table name" end="\ze{" contains=feaTableName skipwhite skipnl nextgroup=feaTableNAMERegion
syntax region feaTableNAMERegion transparent skipwhite skipnl matchgroup=feaCurlyBraces start="{" end="}" contains=feaTableNAME,feaInteger,feaTableString,feaDelimiter fold nextgroup=feaTableName
syntax keyword feaTableNAME contained nameid 

" OS/2 table
syntax region feaTable start="\<table OS/2" end="\ze{" contains=feaTableName skipwhite skipnl nextgroup=feaTableOS2Region
syntax region feaTableOS2Region transparent skipwhite skipnl matchgroup=feaCurlyBraces start="{" end="}" contains=feaTableOS2,feaInteger,feaTableString,feaDelimiter fold nextgroup=feaTableName
syntax keyword feaTableOS2 contained Panose TypoAscender TypoDescender TypoLineGap winAscent winDescent UnicodeRange CodePageRange FSType XHeight CapHeight Vendor WeightClass WidthClass  


" HIGHLIGHT LINKING
highlight link feaReserved Keyword
highlight link feaAnchorKeyword Keyword
highlight link feaMarkClass Keyword
highlight link feaReservedSingleQuote Delimiter

" Scripts & languages
highlight link feaLanguagesystem Function
highlight link feaLanguagesystemNotContained Function
highlight link feaScript Constant
highlight link feaLanguage Constant
highlight link feaLanguagesystemScript Constant

" Tables highlight
highlight link feaTable Function
highlight link feaTableName Function
highlight link feaTableBASE Label
highlight link feaTableGDEF Label
highlight link feaTableHEAD Label
highlight link feaTableHHEA Label
highlight link feaTableOS2  Label
highlight link feaTableSIZE Label
highlight link feaTableVHEA Label
highlight link feaTableVMTX Label
highlight link feaTableNAME Label
highlight link feaTableString String
highlight link feaTableStringEscaped Underlined

" Lookups
highlight link feaLookup Function

" Features
highlight link feaFeature Function
highlight link feaTag Label
highlight link feaSub Function
highlight link feaPos Function
highlight link feaGroup Structure
highlight link feaSubtable Type
highlight link feaFEATUREKeyword Function
highlight link feaAALTKeyword Label
highlight link feaFeatureAALT Function
highlight link feaCPSPKeyword Label
highlight link feaFeatureCPSP Function

" Braces and other delimiters
highlight link feaDelimiter Delimiter
highlight link feaCurlyBraces Delimiter
highlight link feaSquareBrackets Delimiter
highlight link feaAnchorChevrons Delimiter
highlight link feaStringDblQuote Delimiter
highlight link feaGroupEqual Delimiter

" Numbers
highlight link feaInteger Number
highlight link feaVersion Number

" Comments
highlight link feaComment Comment

" Last directive in this syntax file
let b:current_syntax = "fea"
