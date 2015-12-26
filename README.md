# Empirical Macro - Macroeconomic course for CMF

Created 11:00 16.11.2015
Last edited 11:19 26.12.2015

------------------------

Артур Варданян: государственный долг, фискальная политика, инфл. таргетирование / DSGE
Владислав Закатов: общее макро + макропруденциальное регулирование
Fil Ulyakin: парсинг ЦБ, новости
Александр Писанов: цены активов
Анастасия Черкашина: банковский сектор, EViews
Кирилл Кудряшов: ДКП + рынок капитала
Пальцына Екатерина: VAR + Eviews

------------------------

```
DSGE:
   Глеб Куровский: DSGE
   Кирилл Кудряшов + некто с физтеха: 
   Артур Варданян
   Наталья Лаврова

VAR и структурные модели(пп. 2.2. и 3.2.)
   @anastasiacherkashina
   @kate_pyltsyna

парсинг ЦБ:
   @alexander_pisanov
   @fil_ulyankin 
```
   
------------------------

Отдельный доп. кейс - модель банковских резервов (кто-то высказывал интерес к моделированию банковского сектора) 
   
------------------------

```
1. Introduction 

1.1. Objectives of macroeconomic research, areas of research, methods/controversies.

    Diebold, F.X., The Past, Present, and Future of Macroeconomic Forecasting, Journal of Economic Perspectives, 12, 1998, 175-192. 

1.2. Review of macroeconomic statistics frameworks:
    - IO tables
	- SNA
	- Flow of funds
	
1.3. Time series data and seasonal adjustment1
1.3.1. Time series data sources (FRED/Quandl + Russian statistics) 
    - https://research.stlouisfed.org/fred2/
    - https://www.quandl.com/
    - https://github.com/epogrebnyak/rosstat-kep-data

1.3.2. Seasonal adjustment (X11, Traumo/SEATS).

   ESS guidelines on seasonal adjustment
   URL: http://ec.europa.eu/eurostat/documents/3859598/6830795/KS-GQ-15-001-EN-N.pdf/d8f1e5f5-251b-4a69-93e3-079031b74bd3 

   Seasonal Adjustment Methodology at BLS
   URL: http://www.bls.gov/cpi/cpisahoma.htm

   Default procedure: https://github.com/epogrebnyak/rosstat-kep-data/tree/master/seasonality
      	
```

Раздел 1. Задания по подготовке учебных материалов:

1. [ЕП] обзор Diebold 1998 (1.1)

2. [...] упражнения по МОБ и системе национальных счетов (1.2)
  -- три способа расчета ВВП
  -- межстрановые сравнения структуры ВВП
  -- как на макроданных отвечать на прикладные вопросы анализа экономической ситуации
  Что есть: было в прошлогоднем курсе

3. [...] упражнения по статистике денежных потоков (1.2)  
  Выдаются данные по FoF США (levels/flows):
  -- надо описать основные пропорции финансовой системы
  -- ответить на контрольные вопросы
  М.б. аналогичное задание по данным РФ (недавно составили FoF)
  Что есть: было в прошлогоднем курсе
  
4. Написать в R интерфейс для получения данных rosstat-kep-data (1.3.1.)
   -- аккуратное чтение трех CSV файлов в датафреймы (+ возможно обновлние CSV из интернет) 
   -- м.б. датафрейм из базы данных sqlite (реализовано на питоне)

5. дополнительные временные ряды по российской и/или международной статистике 
   -- обработка данных по ценам на нефть (https://github.com/epogrebnyak/fx-oil/blob/master/eia.py) 
   -- данные ЦБ по платежному балансу
   -- данные ЦБ по банковской статистике

6. примеры испоьзования API - как студенты могут программно получить необходимые ряды данных + сравнение с обработкой в Excel (1.3.1.)

7. блок: снятие сезонности (1.3.2.)

8. выбор базовой процедуры снятия сезонности в rosstat-kep-data 


```		
2. Working with macroeconomic time series

2.1. Detrending/filtering and business cycle 

    Introduction to Macro Data. Karel Mertens, Cornell University
    URL: https://courses.cit.cornell.edu/econ614/introduction.pdf       

	Detrending and business cycle facts. Fabio Canova
	URL: http://apps.eui.eu/Personal/Canova/Articles/debucy.pdf
	
	Resuscitating real business cycles. Robert G. King, Sergio T. Rebelo. // 
	Handbook of Macroeconomics, Volume 1, Edited by J.B. Taylor and M. Woodford	
	URL: http://www.tau.ac.il/~yashiv/rbc_handbook.pdf
	
	James H. Stock, Mark W. Watson. Business cycle fluctuations in US macroeconomic time series
	URL: http://www.nber.org/papers/w6528.pdf
	
2.2. Vector autoregression (VAR) models

(*) Modeling the United States Economy. 
	URL: http://es.mathworks.com/help/econ/examples/modeling-the-united-states-economy.html
	(note: text on web site is confusing, this is not a DSGE model, this is a VAR aproximation 
	       used to compare with DSGE results. We are interested in VAR here.)
   
2.3. Nowcasting and coincident indicators

(*) James H. Stock, Mark W. Watson. A Probability Model of The Coincident Economic Indicators. 
    URL: http://www.nber.org/papers/w2772

```

Раздел 2. Задания по подготовке учебных материалов

2.1. Detrending/filtering and business cycle
- упражнения по снятию тренда: 
  -- объяснить процедуры 
  -- прогнать их на фактических данных 
- составить таблицы корреляций трендов экономических переменных c лагом к ВВП (есть примеры таблицы) + их стандартные отклонения
- теория бизнес-цикла - основные положения 

2.2. Vector autoregression (VAR) models
Re: kate_pyltsyna
- введение в методологию - что делают с помощью этого класса моделей, какие результаты, какие ограничения?
- воспроизвести американскую VAR модель
- при возможности - российский аналог 
- задание для студентов 

2.3. Nowcasting and coincident indicators
- введение в методологию - тип решаемой задачи, альтернативные подходы, ожидаемые результаты
- фильтр Калмана 
- применение фильтра Калмана (ненаблюдаемое состояние экономики), воспроизвести James H. Stock, Mark W. Watson. Coincident indicators
- показать аналог на российских данных 

```	
3. Estimated structural modelling 

3.1. Individual indicators

3.1.1. GDP components - consumption 

    Идеи для иллюстрации: цикличность поведения 

3.1.2. GDP components - investment

    Идеи для иллюстрации: сравнение 

3.1.3. GDP components - government spending (?)

    ...

3.1.4.  Prices and inflation.
     
    ...
	
```	
Раздел 3.1. Задания по подготовке учебных материалов

По каждой теме:
- графики индикатора (США, РФ, другие страны)
- зачем это индикатор нужен, где используется
- что влияет на индикатор, какие теоретические или практические идеи по его объяснению и прогнозированию  
- примеры моделей, объясняющие эти индикаторы
- ссылки, с примерами моделей

```		
3.2. Large-scale models: Fair model - US Economy

    http://fairmodel.econ.yale.edu/mmm1.htm
	
	Цели: показать возможности создания, оценки и прогнозов по модели, содержащей систему одновременных уравнений.
	
```	
Задания по подготовке учебных материалов:
- воспроизвести Fair model в EViews, американские данные 
- что можно показывать с помощью этой модели?
- упрощенная модель в R
- пример модели на российскких данных 
Re: kate_pyltsyna

```	
4. Calibrated models: dynamic stochastic general equilibrium models (DSGE)

   - http://www3.eeg.uminho.pt/economia/nipe/summerschool2012/index_ficheiros/outline.pdf
   - http://www.econ.nyu.edu/user/gertlerm/jep.21.4.pdf

    Wieland, Volker,  Tobias Cwik, Gernot J. Müller, Sebastian Schmidt and Maik Wolters. A New comparative approach 
	to macroeconomic modeling and policy analysis. Journal of Economic Behavior and Organization, August 2012, 
	Vol. 83, 523-541 
(*) URL: http://www.macromodelbase.com/

    Applications -  Monetary and fiscal policy rules.  See reading list in 
    Monetary Policy: Theory and Practice - Kiel ASP - Volker Wieland 
    https://www.ifw-kiel.de/ausbildung/asp/outlines/paper/Wieland2014.pdf
```
Проблема: 
(1) участники прислали ряд матриалов, эти материалы надо снова восстанавливать в новой группе Slack (cmf_macro)
(2) присланные модели и материалы пока не выстраиваются в стройный курс

Re: (список участников)

Идея по освещению этого блока:
- рассказать про область применения рассматриваемых моделей, решаемые задачи, результаты и ограничения 
- отдельно про математический аппарат
- дать базовые модели RBC модели с аналитическим представлением и программным кодом, разобрать их созадние и использование (Octave)
- рассказать как создаются более сложные модели и их примеры (без детального разбора)
- продемонстрировать возможности macromodelbase.com - какие вопросы можно иллюстрировать, как это делать?
 
```
5. Balance of payments and foreign exchange rates

5.1  Balance of payments (BOP)

   ...
```

5.1  Balance of payments (BOP) - Платежный баланс - ПБ 
   - основные концепции статистики ПБ, возможности его моделирования
   - различные формы предлставления ПБ, описательная статистика по российским данным
   - ПБ других страны + международные потоки капитала (США/Китай)
   - связь ПБ с СНС

```
5.2 Exchange rates
   
- Puzzles in foreign exchange rate forecasting 

(*) L Sarno. Viewpoint: Towards a solution to the puzzles in exchange rate economics: where do we stand?
    http://onlinelibrary.wiley.com/doi/10.1111/j.0008-4085.2005.00298.x/abstract

- Review of methods:

(*) Barbara Rossi. Exchange Rate Predictability. February 14, 2013
    URL: http://crei.cat/people/rossi/Rossi_ExchangeRatePredictability_Feb_13.pdf

- Rouble vs oil
```
Re: Алексей Филиппов - philippov.ap __ gmail.com



------------------------

Комментарии (10:49 16.11.2015):

Основные направления/блоки в курсе следующие: 
- **эконометрика временных рядов (п.2)** + VAR модели + оценка состояния экономики в текущем времени (nowcasting), применение - анализ бизнес-циклов
(комментарий: как я понимаю эконометрический аппарат уже прочитает Ярослав, может быть дать какие-то дополнительные задания/примеры. Есть два понятных кейса - VAR модель по США + разработка оперативных индикаторов цикла)

- **структурные эконометрические модели (п.3)**: моделирование отдельных показателей (компоненты ВВП - потребление, инвестиции; ИПЦ; другие показатели) и large-scale модели, применение - построение прогнозов 
(комментарий: есть пример публичной large-scale модели для CША - Fair model, она в соственной программной оболочке и в EViews есть, хорошо, если бы кто-то мог посмотреть и рассказать вариант EViews, дать упрощенную версию. по отдельным показателям/блокам подход предлагается такой - смотрим данные, смотрим краткой теорию  от чего в приницпе может зависить потребление, инвестиции и т.д., строим простую модель рассматриваемого показателя, чтобы оцфировать идеи из теориии)

- **"калибровочные" модели DSGE-типа (п.4)**, применение - анализ денежно-кредитной и фискальной политики
(комментарий: это пока самая слабая часть, я сам такие модели не строил, есть каталог таких моделей www.macromodelbase.com, по инструментарию - MATLAB/Octave + Dynare/IRIS, на факультете кто-то читал курс по DSGE на матметодах, может что-то слушал этот курс, работал с этими моделями) 

По данным я работаю над небольшой базой данных российской статистики, из котрой можно будет брать ряды. Это должно ускорить работу студентов над задачами, чтобы они ни сидели над сбором и выбором статистики сами, что может занимать много времени. Сейчас в базу данных склдывается часть публикации Росстата "Краткосрочные экономические показатели" (КЭП), неплохо конечно расширить за счет данных ЦБ (например, в KЭП нет ряда мировых цен нефти). Для иностранных данных (США, в основном) - quandl/FRED. **(п. 1.3.1)**  
Вспомогательная тема по статистике - снятие сезонности.**(п. 1.3.2)**

Что мы не делаем, на данном этапе, скорее всего:
- международная торговля/потоки капитала
- экономические кризисы и антикризинсая политика
- экономика пенсионных систем
 
Отдельным списков предагаемые добавления/идеи готов вести (то что предлагается в чате). Программу курса готов поддерживать/показывать на гитхабе, можно открыть dropbox. Мне удобнее git и Amazon S3, 
здорово если кто-то еще использует S3, чтобы синхронизриовать. 
