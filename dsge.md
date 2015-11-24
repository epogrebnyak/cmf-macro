17:22 23.11.2015 Comment:

I don't know whether the course should be introductory, intermediate or advanced level. Whether it should be more theoretical or applied. I think you should show him these three syllabi: 

A) <http://akson.sgh.waw.pl/~mkolas/Syllabus/ADMacro.pdf>  
B) <http://akson.sgh.waw.pl/~mkolas/Syllabus/ADMacro2.pdf>  
C) <http://akson.sgh.waw.pl/~mkolas/Syllabus/MacroMod.pdf>

Now, A is introduction while B is intermediate level course. Both are theoretical. A is appropriate for student without any knowledge, while B for those who know Ramsey model, which is a workhorse for all NK models. C is rather applied since we've had in in the computer room. Part of the topics can be covered in this theoretical courses to show students why they need such models 
When it comes to the textbooks then I think that the starting point is Gali (2008) - I already sent you it (see my mail from 5 Jul). There is also textbook by Walsh. Unfortunately I don't have pdfs of Woodford and of Benassy, but they are also good intro to the topic (I've read them).

akson.sgh.waw.pl

-----
See also: 

- Intro to Dynare. http%3A%2F%2Fpeople.bu.edu%2Frking%2FSZGcourse%2FMSpresentation%2520dynare%2520short.pdf
- http%3A%2F%2Fwww.sfu.ca%2F~kkasa%2FSargent_Dynare.pdf

Octave + Dynare:
- http://www.dynare.org/download/octave/windows
- http://www.dynare.org/documentation-and-support/quick-start


-----


4 Calibrated models: dynamic stochastic general equilibrium models (DSGE)
=========================================================================

##Участники:
-  e.pogrebnyak
-  gleb_kurovskiy
-  arthur_v

##Todo - задание участникам(12:59 19.11.2015):

1 дать комментарии к плану занятий (этот файл), просьба прислать отдельным txt файлом

2 у кого есть Matlab - зарегистрироваться http://www.macromodelbase.com/, скачать модели и запустить интерфейс 
  выбора и работы с моделями, оценить можем ли использовать в курсе


##План лекции:


1. Мотивация исследований / история возникнования данного класса моделей (критика структурных моделей)

  <ссылки на работы>

2. Простые модели, опирающиеся на микроэкономические основания (microeconomic foundations)

  - модель роста Солоу
  - + сектор домашних хозяйств 
  - + frictions (транзакционые издержки / номинальная жесткость издержек)
  - + ... еще какие-то расширения

  Эти модели формулируются и решаются студентами в Octave, строятся результирующие графики. 
  Может быть вариант с python, но он более экзотичный, новый. 
  Обсуждаются вопросы калибровки моделей, оценивания на реальных данных, 

3. Работа с существующими моделями

Вариант 1 - придумываем как запустить macromodelbase на Octave, чтобы студенты могли поработать с разными моделями

Вариант 2 - берем какую-то одну более сложную модель в Octave / python, показываем ее применение 

Вариант 3 - кто работал с собственной DSGE моделью может рассказать про их разработку и использование



##Учебники:

-   DeJong, David N., and Chetan Dave. 2011.
    Structural Macroeconometrics. Second edition.
    Princeton: Princeton University Press.

-   Fabio Canova. 2007. Methods for Applied Macroeconomic Research
    Princeton: Princeton University Press.

   
##Статьи и источники:

-   ЕП: добавть ключевы статьи из macroecomics reader и https://ideas.repec.org/k/qmrbcrl.html

-   Wieland, Volker,  Tobias Cwik, Gernot J. Muller, Sebastian Schmidt and Maik Wolters. A New comparative approach 
    to macroeconomic modeling and policy analysis. Journal of Economic Behavior and Organization, August 2012, 
    Vol. 83, 523-541 
(*) URL: http://www.macromodelbase.com/

-   Applications -  Monetary and fiscal policy rules.  See reading list in 
    Monetary Policy: Theory and Practice - Kiel ASP - Volker Wieland 
    https://www.ifw-kiel.de/ausbildung/asp/outlines/paper/Wieland2014.pdf

---------------------------------------------------------------------------------

(*) Estimating a Real Business Cycle DSGE Model by Maximum Likelihood in Python
    http://pages.uoregon.edu/cfulton/posts/estimating_rbc.html


    Ruge-Murcia, Francisco J. 2007.
    "Methods to Estimate Dynamic Stochastic General Equilibrium Models."
    Journal of Economic Dynamics and Control 31 (8): 2599–2636.

---------------------------------------------------------------------------------

##Unsorted URLS:

Пример кода в python (June 21, 2015) - http://pages.uoregon.edu/cfulton/posts/estimating_rbc.html

http://www.nviegi.net/research/dsge.htm

https://dge.repec.org/

https://ideas.repec.org/zimm/courses/

<http://www.macromodelbase.com/system/files/upload/MMB_replications_2_0_0.zip> may mot work in 
some browsers, try FireFox and ignore warning on file contents.

http://www3.eeg.uminho.pt/economia/nipe/summerschool2012/index_ficheiros/outline.pdf

http://www.econ.nyu.edu/user/gertlerm/jep.21.4.pdf

http://www.bis.org/publ/work258.htm

http://www.tau.ac.il/~yashiv/ch7_handbook_christiano.pdf

http://www.bis.org/publ/work258.htm

http://www.skchugh.com/images/701_Lecture2_Sept2.pdf

http://worthpublishers.com/Catalog/WorkArea/DownloadAsset.aspx?id=4095&libID=4117

http://conference.scipy.org/proceedings/scipy2014/pdfs/pugh.pdf

https://sites.google.com/site/joaoantoniorodriguesmadeira/home/dynare

http://www.michael-curran.com/teaching/Macro-Applications.pdf

http://faculty.wcas.northwestern.edu/~lchrist/course/Colombia_2010/Ch07_3rd_proof_KW_MT.pdf
