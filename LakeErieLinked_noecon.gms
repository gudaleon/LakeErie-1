$ontext

Code created by:
Travis Warziniack, USFS Rocky Mountain Research Station
David Finnoff
Jenny Johnson
Version: August 4, 2014

The basic model is developed through a series of steps shown as CGE exercises at
http://www.warziniack.com/research

$offtext

Set  f  all factors /
LAB     Employee Compensation
CAP     Proprietary Income
/;

Set a  all producing sectors /
AGR
AFISH
EFISH
WALL
YPERCH
WPERCH
WBASS
SMELT
CCAT
CARP
BUFF
POW
WATR
MISC
RFISH
AIRT
RAILT
WTRT
TRKT
/

TAC(a)/
 WALL
YPERCH /

EV(a)/
AGR
AFISH
EFISH
WPERCH
WBASS
SMELT
CCAT
CARP
BUFF
POW
WATR
MISC
RFISH
AIRT
RAILT
WTRT
TRKT
/;

Set h households by income decile
/HHD1,HHD2,HHD3,HHD4,HHD5,HHD6,HHD7,HHD8,HHD9/;

set taxes taxes inventory trade /INDT,INV,DT,FT/;
set t(taxes) /DT,FT/;
set g  governments /FGOV,SGOV/;

ALIAS(a,c);
alias (a,aa),(c,cc),(h,hh),(f,ff),(g,gg),(t,tt);

* read in sam data
* $include read_sam.gms


*** ----------- DATA ---------------------
******************************************


Table SAM(*,*) intermediate demand j to i

         AGR             EFISH           AFISH           WALL            YPERCH          WPERCH          WBASS           SMELT           CCAT            CARP            BUFF            POW             WATR            MISC            RFISH           AIRT            RAILT           WTRT            TRKT
AGR      826.5519187     0               0               0               0               0               0               0               0               0               0               0.448441201     0.010828448     6358.511442     2.176880111     0.075068868     10.93024599     0.007869134     0.065828178
EFISH    0               33.80238118     0               0               0               0               0               0               0               0               0               0               0               201.9490416     0.069138643     0               0               0               0
AFISH    0               0               0.033997294     0               0               0               0               0               0               0               0               0               0               0.20311353      6.95373E-05     0               0               0               0
WALL     0               0               0               0.001385022     0               0               0               0               0               0               0               0               0               0.008274678     2.83289E-06     0               0               0               0
YPERCH   0               0               0               0               0.511838772     0               0               0               0               0               0               0               0               3.057931004     0.001046904     0               0               0               0
WPERCH   0               0               0               0               0               0.027121799     0               0               0               0               0               0               0               0.162036552     5.54743E-05     0               0               0               0
WBASS    0               0               0               0               0               0               0.034673473     0               0               0               0               0               0               0.207153295     7.09204E-05     0               0               0               0
SMELT    0               0               0               0               0               0               0               7.34099E-05     0               0               0               0               0               0.00043858      1.50151E-07     0               0               0               0
CCAT     0               0               0               0               0               0               0               0               0.01642742      0               0               0               0               0.098144022     3.36003E-05     0               0               0               0
CARP     0               0               0               0               0               0               0               0               0               0.011497173     0               0               0               0.068688744     2.35161E-05     0               0               0               0
BUFF     0               0               0               0               0               0               0               0               0               0               0.022089969     0               0               0.131974371     4.51823E-05     0               0               0               0
POW      0               0               0               0               0               0               0               0               0               0               0               14.44045888     0               138.4969691     0.04741539      0               0               0               0
WATR     31.83374096     0               0               0               0               0               0               0               0               0               0               0.806453244     6.669242376     3690.918767     1.263611417     42.60746477     243.7933974     3.88083543      11.78803785
MISC     4043.850932     143.4520177     0.144279198     0.005877816     2.172163675     0.115100671     0.147148795     0.00031154      0.069715399     0.048792205     0.093746371     41.1619042      3328.935692     518527.7254     177.521532      1605.825015     3338.236396     822.2240283     9630.975557
RFISH    1.384440171     0.049111785     4.9395E-05      2.01231E-06     0.000743655     3.94055E-05     5.03774E-05     1.06658E-07     2.38675E-05     1.67043E-05     3.20947E-05     0.014092061     1.139684023     177.521532      0.060775717     0.549765235     1.142868183     0.281494049     3.297230701
AIRT     0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0
RAILT    18.76888439     0               0               0               0               0               0               0               0               0               0               0               4.818417119     201.2570194     0.068901724     0               0               0               0
WTRT     0               0               0               0               0               0               0               0               0               0               0               0               0               210.0505451     0.071912248     20.7160657      32.93619703     10.31725385     0
TRKT     0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0
LAB      517.4101164     18.38679406     0.018492817     0.000753382     0.278414531     0.014752894     0.018860624     3.99313E-05     0.008935689     0.006253884     0.012015831     16.79841805     594.8410645     337369.246      115.500681      2050.661377     3756.850342     1097.115479     13824.07324
CAP      2015.736568     100.4966796     0.101076169     0.00411776      1.521729987     0.080634874     0.103086492     0.000218252     0.048839788     0.034181845     0.065674914     42.6559267      1075.525715     227216.5396     77.78914459     708.45          3027.63         1612.11         3835.18
INDT     101.6595153     4.954560212     0.004983129     0.000203009     0.075022407     0.003975359     0.00508224      1.076E-05       0.002407837     0.00168519      0.003237822     0.795264959     400.1091003     42776.00391     14.64465905     125.7218475     206.1458893     28.19690323     335.1819763
HHD1     0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0
HHD2     0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0
HHD3     0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0
HHD4     0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0
HHD5     0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0
HHD6     0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0
HHD7     0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0
HHD8     0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0
HHD9     0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0               0
FGOV     20.39786339     0               0               0               0               0               0               0               0               0               0               0               0               189.5676592     0.064899792     0               0               0               0
SGOV     0               0               0               0               0               0               0               0               0               0               0               0               0               13431.66294     4.598422157     411.7244873     4567.88623      99.47229004     0
INV      294.7308978     0               0               0               0               0               0               0               0               0               0               0               0               14045.04835     4.808418872     0               0               0               0
FT       990.8085455     1.586845569     0.001595996     6.50195E-05     0.024028162     0.001273227     0.001627739     3.44621E-06     0.000771182     0.000539732     0.001037009     0.058020327     1.455318869     128149.2966     43.87279279     0               38.9725879      0.09736569      0
DT       5099.470535     19.26479293     0.019375879     0.000789357     0.29170927      0.015457368     0.019761249     4.1838E-05      0.009362383     0.00168519      0.003237822     96.525402       1818.281275     272344.7934     93.23911256     62.54944229     1825.344199     591.157411      258.6427635

+        LAB             CAP             INDT            HHD1            HHD2            HHD3            HHD4            HHD5            HHD6            HHD7            HHD8
AGR      0               0               0               88.94626708     80.82520854     186.1524391     235.1246616     368.6658278     530.8379478     360.4707113     314.3368628
EFISH    0               0               0               0               0               0               0               0               0               0               0
AFISH    0               0               0               0               0               0               0               0               0               0               0
WALL     0               0               0               0               0               0               0               0               0               0               0
YPERCH   0               0               0               0               0               0               0               0               0               0               0
WPERCH   0               0               0               0               0               0               0               0               0               0               0
WBASS    0               0               0               0               0               0               0               0               0               0               0
SMELT    0               0               0               0               0               0               0               0               0               0               0
CCAT     0               0               0               0               0               0               0               0               0               0               0
CARP     0               0               0               0               0               0               0               0               0               0               0
BUFF     0               0               0               0               0               0               0               0               0               0               0
POW      0               0               0               0               0               0               0               0               0               0               0
WATR     0               0               0               83.07717133     77.63896179     186.8034363     225.6251678     305.0356445     469.7824707     289.6412048     271.8536682
MISC     0               0               0               12929.44283     10843.02198     27232.73461     33106.26165     55090.72249     90922.5075      63651.2821      59859.39302
RFISH    0               0               0               4.426483652     3.712183127     9.323313937     11.3341563      18.86068763     31.12794559     21.79145407     20.49327477
AIRT     0               0               0               49.23966217     44.51896286     64.27878571     75.91825104     155.1717224     505.9430542     299.2244873     450.0101929
RAILT    0               0               0               1412.407593     581.5584106     552.9788208     811.9799805     903.9946289     1599.834717     935.6091919     1214.244995
WTRT     0               0               0               57.66943359     24.46320915     60.39289856     101.5906372     293.7054138     711.2567139     258.3804932     313.0204163
TRKT     0               0               0               749.3960571     828.6509399     1761.771973     2007.253906     3580.099121     5527.287109     4038.381592     3330.772705
LAB      0               0               0               0               0               0               0               0               0               0               0
CAP      0               0               0               0               0               0               0               0               0               0               0
INDT     0               0               0               0               0               0               0               0               0               0               0
HHD1     1512.698958     302.1655655     0               0               0               0               0               0               0               0               0
HHD2     1895.563511     467.3071021     0               0               0               0               0               0               0               0               0
HHD3     10463.36732     1791.492471     0               0               0               0               0               0               0               0               0
HHD4     18575.72283     2944.803975     0               0               0               0               0               0               0               0               0
HHD5     37953.82785     5777.723573     0               0               0               0               0               0               0               0               0
HHD6     80388.48988     10013.73878     0               0               0               0               0               0               0               0               0
HHD7     56469.3212      8860.194771     0               0               0               0               0               0               0               0               0
HHD8     57218.13771     12594.70968     0               0               0               0               0               0               0               0               0
HHD9     50258.92285     31525.068       0               0               0               0               0               0               0               0               0
FGOV     43461.67383     3925.395049     5430.398457     -65.69166565    -317.7965088    -235.3603516    679.4368286     2701.607178     7710.651855     6847.805664     8577.020508
SGOV     1163.516144     1707.485565     38563.11178     103.9729055     33.52520482     473.2591715     990.4145594     1986.578894     4504.791927     3506.50787      3632.034245
INV      0               149400.1402     0               0               0               0               0               0               0               0               0
FT       0               -25.77843857    0               403.2686533     357.0890063     860.3958277     1013.412104     1764.232112     2796.815262     1987.608353     1850.081026
DT       0               10429.63865     0               -403.2686533    -357.0890063    -860.3958277    -1013.412104    -1764.232112    -2796.815262    -1987.608353    -1850.081026


+        HHD9            FGOV            SGOV            INV             FT              DT
AGR      327.7950611     13.47942066     62.83992028     0.066508974     1261.078169     2933.206397
EFISH    0               0               0               0.005491924     38.29254294     47.87458497
AFISH    0               0               0               5.52359E-06     0.038513347     0.048150642
WALL     0               0               0               2.25027E-07     0.001569002     0.001961617
YPERCH   0               0               0               8.31592E-05     0.579829215     0.724921379
WPERCH   0               0               0               4.40652E-06     0.030724541     0.038412822
WBASS    0               0               0               5.63345E-06     0.039279347     0.049108319
SMELT    0               0               0               1.1927E-08      8.31613E-05     0.000103971
CCAT     0               0               0               2.66899E-06     0.018609567     0.023266287
CARP     0               0               0               1.86796E-06     0.013024408     0.016283539
BUFF     0               0               0               3.58899E-06     0.025024304     0.031286201
POW      0               0               0               0               0               60.71953538
WATR     255.8152924     33.024333       469.2478485     0               3.222004175     527.4576447
MISC     66370.79208     22280.67766     99043.38843     110958.8119     89870.10246     281210.6826
RFISH    22.72249701     7.62794319      33.90818501     37.98751216     30.76764749     96.2744107
AIRT     880.3644409     0               0               0               0               2504.215081
RAILT    1944.467163     264.2676392     506.3787842     0               51.7083931      6045.526602
WTRT     412.119812      13.57161474     115.0080566     0               0               1629.588394
TRKT     3650.925049     8.047743797     48.37116241     0               0.085661426     2368.162562
LAB      0               0               0               0               0               0
CAP      0               0               0               0               0               0
INDT     0               0               0               0               0               0
HHD1     0               82.60401917     11.68649006     13483.82762     0               19.90408502
HHD2     0               101.446167      14.35219574     9696.50776      0               24.94181482
HHD3     0               375.6047974     53.13903809     17471.05454     0               137.6769328
HHD4     0               568.9869995     80.49802399     15830.50871     0               244.4192644
HHD5     0               1020.492798     144.3751984     20008.62592     0               499.3962695
HHD6     0               1664.694702     235.514267      19153.83228     0               1057.751332
HHD7     0               1279.022095     180.9508362     12676.58283     0               743.0230348
HHD8     0               1283.89563      181.6404114     5951.920495     0               752.8759585
HHD9     0               3596.880127     508.8722229     10325.91699     0               661.3066455
FGOV     12548.74219     11473.01196     0               14160.9624      0               0
SGOV     4604.211197     24981.8125      49904.91895     2981.226276     0               0
INV      5859.012052     48058.73967     6057.621533     29224.40267     67419.43373     0
FT       2133.657324     650.3937154     1423.451219     14234.6321      744.8947449     0
DT       -2133.657324    -650.3937154    -1423.451219    24167.05867     0               0
;


parameter
        HHXo(c,h)        demand of commodity c by household h
        QGOVo(g,c)       amount supplied by government
        XGOVo(c,g)       amount consumed by government
        HTRNSo(h,g)      government transfers to households
        QINVo(c)         inventory available for supply
        RENTo(f)         factor rents
        HSAVo(h)         household savings
        GSAVo(g)         government savings or additions to inventory
        INVADJo          inventory adjustments
        ITo(c)           firm investments or additions to inventory
        HINTINCo(h)      household interest income
        ENTAXo(g)        enterprise taxe - goverment tax on inventory
        XEo(c,t)         exports to trade partner row
        HEXINCo(h,t)     household income from outside
        EXOSAVo(t)       exogenous savings to trade partners
        QIMPo(t,c)       imports to trade partner row
        FACOUTo(t,f)     factor payments out of region
        FORSAVo(t,h)     household foreign savings
        AIDo(t,g)        government payments to rest of world
        EXINTo(t)        interest payments to rest of world
        TRDBRWo          transfers from rest of world to rest of world;

        HHXo(c,h)       = sam(c,h);
        QGOVo(g,c)      = sam(g,c);
        XGOVo(c,g)      = sam(c,g);
        HTRNSo(h,g)     = sam(h,g);
        QINVo(c)        = sam('inv',c);
        RENTo(f)        = sam('inv',f);
        HSAVo(h)        = sam('inv',h);
        GSAVo(g)        = sam('inv',g);
        INVADJo         = sam('inv','inv');
        ITo(c)          = sam(c,'inv');
        HINTINCo(h)     = sam(h,'inv');
        ENTAXo(g)       = sam(g,'inv');
        XEo(c,t)        = sam(c,t);
        HEXINCo(h,t)    = sam(h,t);
        EXOSAVo(t)      = sam('inv',t);
        QIMPo(t,c)      = sam(t,c);
        FACOUTo(t,f)    = sam(t,f);
        FORSAVo(t,h)    = sam(t,h);
        AIDo(t,g)       = sam(t,g);
        EXINTo(t)       = sam(t,'inv');
        TRDBRWo         = sam('ft','ft');

*Clearing up busts manually

XEo('CARP','DT')=XEo('CARP','DT')+ (-0.004867326/2);

QIMPo('DT','CARP')=QIMPo('DT','CARP')+ 0.004867326/2;

XEo('BUFF','DT')=XEo('BUFF','DT')+ (-0.009351784
/2);

QIMPo('DT','BUFF')=QIMPo('DT','BUFF')+ 0.009351784
/2;


parameter elast(*) /

         AGR    .8
         AFISH  .8
         EFISH  .8
         WALL   .8
         YPERCH .8
         WPERCH .8
         WBASS  .8
         SMELT  .8
         CCAT   .8
         CARP   .8
         BUFF   .8
         POW    .8
         WATR   .8
         MISC   .8
         RFISH  .8
         AIRT   .8
         RAILT  .8
         WTRT   .8
         TRKT   .8/;

* to do: use data file to input the following:
parameter scvalues(*)   /

         AGR    3.15
         AFISH  3.15
         EFISH  3.15
         WALL   3.15
         YPERCH 3.15
         WPERCH 3.15
         WBASS  3.15
         SMELT  3.15
         CCAT   3.15
         CARP   3.15
         BUFF   3.15
         POW    3.15
         WATR   3.15
         MISC   3.15
         RFISH  3.15
         AIRT   3.15
         RAILT  3.15
         WTRT   3.15
         TRKT   3.15/;

parameter stvalues(*) /

          AGR    2.9
          AFISH  2.9
          EFISH  2.9
          WALL   2.9
          YPERCH 2.9
          WPERCH 2.9
          WBASS  2.9
          SMELT  2.9
          CCAT   2.9
          CARP   2.9
          BUFF   2.9
          POW    2.9
          WATR   2.9
          MISC   2.9
          RFISH  2.9
          AIRT   2.9
          RAILT  2.9
          WTRT   2.9
          TRKT   2.9/;

$ontext
* Original WTP, cactch, and fish per hour from Besedin et al (2004)
table besedin(*,*)
                w2p             catch           fph     totdays         weight
*               ($/fish)        (fish/yr)       (f/h)   (mil days/year) (kg/fish)
  bass          12.86           3048444         0.15    1.7             1.1
  perch         2.47            10808297        0.758   1.8             0.17
  walleye       18.43           1693872         0.081   3.2             1.5
  salmon        20.13           1905185         0.129   6.1             2.7
  other         2.47            28885829        0.337   1.1             1.5
;
* other is not used in the model because Besedin find a near zero
* net welfare gain from `other' fishing trips


table bench(*,*)
* from EwE
                catch           stck
*               (tonnes/yr)     (tonnes)
  bass          148             714
  perch         1886            17457
  walleye       2053            22528
  salmon        256             1344
  other         121             30742
;


parameters population IMPLAN population in Lake Erie geography /15408900/
           avghhincome(h) average angler income from Besedin
                 /
                 HHD1 39151
                 HHD2 39151
                 HHD3 39151
                 HHD4 39151
                 HHD5 39151
                 HHD6 39151
                 HHD7 39151
                 HHD8 39151
                 HHD9 39151
                 /
           fishingpop population likely to fish in Lake Erie;

* Assume 20 percent of population fishes
fishingpop = population * 0.2;
$offtext

parameter  sig_f(h)          elasticity of substitution between species
                         /
                         HHD1 0.9
                         HHD2 0.9
                         HHD3 0.9
                         HHD4 0.9
                         HHD5 0.9
                         HHD6 0.9
                         HHD7 0.9
                         HHD8 0.9
                         HHD9 0.9
                         /;


****************************************************
* CGE MODEL
****************************************************

* ---- Prices -------

variables PC(c) market clearing Armington goods price
          PD(c) domestic goods price
          PF(f) factor prices;

* --- Market clearing ----
* In each goods market, domestic prices adjust such that total supply equals total demand

variables Q(c) total supply
          X(c) total demand;

* -- FIRMS ----------------------------------

* 1. Human inputs / Effort

variables DY(c) total output of firm c
          CV(c) total costs of firm c
          PI(c) profit of firm c
          V(a,c) intermediate inputs of firm a used by c
          VA(C) demand for valu-added
          FAC(f,c) factor demand of f by c
          PVA(a) primry variable cost for value added
          TAX(a);

equations eqDY(a)
          eqCV(a)
          eqV(c,a)
          eqVA(a)
          eqFAC(f,a)
          EQPVA(a)
          eqPD(a)
          eqTAX(a);

parameters
        ibtr(a)         business tax rate imposed on industry i
        tva(f,a)        calibration parameter for value added
        eta(a)          parameter for value added function based on elasticity of substitution
        sf(a)            elasticity of substitution between capital and labor
        aint(c,a)       share of a's output produced by using c
        ava(a)          share of a's output produced using factors

        Vo(c,a)          intermediate demand by industry a of commodity c
        VAo(a)          benchmark value added input
        DYo(a)          output of local firms
        FACo(f,a)       demand of factor f by industry a;

* benchmark values
    Vo(c,a) = sam(c,a);
    FACo(f,a) = sam(f,a);
    VAo(a)= sum(f,FACo(f,a));
    DYo(a) = VAo(a) + sum(c,Vo(c,a)) + sam('indt',a);

eqTAX(c)..    TAX(c) =e= ibtr(c)*DY(c);
                        ibtr(a) = sam('indt',a)/DYo(a);

EQCV(a)..     CV(a) =e= sum(c, V(c,a)*PC(c))
                                  + (VA(a) * (sum(f$tva(f,a),(PF(f)/tva(f,a))**eta(a)))**(1/eta(a)))$VAo(a)
                                  + DY(a)*ibtr(a);
                        sf(a) = elast(a);
                        eta(a) = 1 - sf(a);
                        tva(f,a)$FACo(f,a) = (VAo(a)/FACo(f,a))**(1/eta(a));

EQV(c,a)..    V(c,a) =e= aint(c,a)*DY(a);
                         aint(c,a) = Vo(c,a) / DYo(a);

EQVA(a)..     VA(a) =e= ava(a)*DY(a);
                        ava(a) = VAo(a) / DYo(a);

EQFAC(f,a)..  FAC(f,a) =e= (VA(a) * (tva(f,a)/PF(f))**sf(a) * 1/(tva(f,a) *
                                     sum(ff$tva(ff,a), PF(ff)**(1-sf(a)) * tva(ff,a)**(sf(a)-1))))$FACo(f,a);

EQPVA(a)..    PVA(a) =e= sum(ff$tva(ff,a), PF(ff)**(1-sf(a)) * tva(ff,a)**(sf(a)-1));

* 2. Biomass + Human inputs produce fishing

set walleye(a) /wall/
    yp(a) /yperch/
    nonreg(a) /
         AGR
         AFISH
         EFISH
         WPERCH
         WBASS
         SMELT
         CCAT
         CARP
         BUFF
         POW
         WATR
         MISC
         RFISH
         AIRT
         RAILT
         WTRT
         TRKT       /
;

variables   TQ(a)      Regional Total Allowable Catch ;

equations   EQTACW1(walleye)      Total Allowable Catch Equation 1
            EQTACW2(walleye)      Total Allowable Catch Equation 2
            EQTACW3(walleye)      Total Allowable Catch Equation 3
            EQTACW4(walleye)      Total Allowable Catch Equation 3
            EQTACYP(yp)      TAC yellow perch;

Variables DYF(tac), DY(a), EXPENDF(a);

Equation  EQCONNECT(tac), EQEXPENDF(a), EQDYF(tac);

parameter J(a) Shock parameter /
 WALL   1
 YPERCH 1 / ;

parameter BIO(a) inition commercial biomass input /
         AGR    0
         AFISH  0
         EFISH  0
         WALL     1.738
         YPERCH   1.227
         WPERCH 0
         WBASS  0
         SMELT  0
         CCAT   0
         CARP   0
         BUFF   0
         POW    0
         WATR   0
         MISC   0
         RFISH  0
         AIRT   0
         RAILT  0
         WTRT   0
         TRKT   0 /;

parameter wally(*) /
         AGR    0
         AFISH  0
         EFISH  0
         WALL   1
         YPERCH 2
         WPERCH 0
         WBASS  0
         SMELT  0
         CCAT   0
         CARP   0
         BUFF   0
         POW    0
         WATR   0
         MISC   0
         RFISH  0
         AIRT   0
         RAILT  0
         WTRT   0
         TRKT   0    /;

Parameter alphaEffort(a)  C-D Parameter for EFfort /
         AGR    1
         AFISH  1
         EFISH  1
         WALL     .462502
         YPERCH   .213011
         WPERCH 1
         WBASS  1
         SMELT  1
         CCAT   1
         CARP   1
         BUFF   1
         POW    1
         WATR   1
         MISC   1
         RFISH  1
         AIRT   1
         RAILT  1
         WTRT   1
         TRKT   1/;


Parameter
DYFo(tac)        Domestic harvest (calibrated)
TQoo(tac)         Total allowable catch (calibrated);

parameter afe(c) Cobb-Douglas Commercial Share Parameters between VA and Biomass;
afe(c) = 0; afe('wall') = 0.65; afe('yperch') = 0.65;

parameter bfe(c) Cobb-Douglas Commercial Share Parameters between VA and Biomass;
bfe(c) = 0; bfe('wall') = 0.35; bfe('yperch') = 0.35;

parameter dfe(tac) Share Parameter;
dfe(tac)=(DYo(tac))/(((sum(f, FACo(f,tac)))**afe(tac))*((BIO(tac))**bfe(tac)));

DYFo(tac) = dfe(tac)*(VAo(tac)**afe(tac))*((J(tac)*BIO(tac))**(bfe(tac)));

parameter TQo(c) Benchmark TAC Estimated;

TQo(nonreg) = DYo(nonreg);
TQo(tac)$(((bio(tac))> 2.555710956) and (wally(tac)=1)) = 0.5694*0.35*(bio(tac));
TQo(tac)$((0.987412587<=(bio(tac))) and ((bio(tac))< 1.332556333)and (wally(tac)=1)) = 0.5694*((bio(tac))*(0.02*bio(tac)+.08));
TQo(tac)$((1.332556333<=(J(tac)*bio(tac))) and ((J(tac)*bio(tac))<= 2.555710956)and (wally(tac)=1)) = 0.5694*((J(tac)*bio(tac))*(0.1128*J(tac)*bio(tac)+0.05));
TQo(tac)$(((J(tac)*bio(tac))< 0.987412587) and (wally(tac)=1)) = 0.5694*0.1*J(tac)*bio(tac);
TQo(tac)$(wally(tac)=2) = 0.52678*(0.07837 + 0.09919*J(tac)*bio(tac));

$ontext
-- HOUSEHOLD --------------

Households are heterogenous in preferences and income. Each household maximizes constant elasticity of
substitution (CES) preferences

        U = (theta(agr,h)*HHX(agr,h)**rh(h) + theta(watr,h)*HHX(watr,h)**rh(h))**(1/rh(h))

where rh(h) is a parameter based on the elasticity of substiution rh(h) = 1 - 1/sh(h), subject to a budget
constraint.

        HHI = PD(agr)*HHX(agr,h) + PD(watr)*HHX(watr,h) + household taxes + savings

We define ah(c,h) = theta(c,h)**alpha**(1/rh) so the utility function can be written

        U = ( sum(c, (alpha(c,h)*HHX(c,h))**rh) )**(1/rh)

The household owns capital and labor which earn prices PF(f) in the marketplace. Earnings from factors are assumed
to go to factor 'institutions' then distributed to the households based on their share of the factor. The
household pays taxes to the government and receives transfers from the government. Household disposable income
is used for consumption. Households save a fixed percentage of pre-tax income.
$offtext

parameter
        HHIo(h)         household income
        HHIDo(h)        household disposable income
        HHXo(c,h)       household demand of commodity c
        FACPMTo(f)      total payments to factor
        thetaf(h,f)     share of factor f owned by household h
        sh(h)           household elasticity of substitution taken from the literature
        rh(h)           parameter based on sh(h)
        ah(c,h)         share of good i in demand function
        htr(g,h)        household tax rate
        mps(h)          marginal propensity to save
        mpsf(t,h)       marginal propensity to save in foreign sources
        afout(t,f)      portion of factor payments that leave the country
        endow(h,f)       endowment of factor f by household h ;

parameter fishy(*) /
         WALL   1
         YPERCH 1 /;

variables   HHI(h), HHID(h), HTRNS(h,g), HHX(c,h), FACPMT(f);

equations   EQFACPMT(f), EQHHI(h), EQHHID(h), EQHHX(c,h), EQHHX2(c,h);

EQFACPMT(f).. FACPMT(f) =e= (sum(ev,FAC(f,ev)*PF(f))+ sum(tac,FAC(f,tac)*PF(f)))*(1-sum(t,afout(t,f)));
                            afout(t,f) = FACOUTo(t,f) / sum(a,FACo(f,a));

EQHHI(h)..    HHI(h) =e= sum(f,thetaf(h,f)*FACPMT(f)) + sum(g,HTRNS(h,g)) + HINTINCo(h)
                         + sum(t,HEXINCo(h,t));
                         endow(h,f) = sam(h,f);
                         FACPMTo(f) = sum(a,FACo(f,a))*(1-sum(t,afout(t,f)));
                         thetaf(h,f) = endow(h,f)/FACPMTo(f);

EQHHID(h)..   HHID(h) =e= HHI(h)*(1-sum(g,htr(g,h)) - mps(h) - sum(t,mpsf(t,h)));
                          HHIo(h) = sum(f,thetaf(h,f)*FACPMTo(f)) + sum(g,HTRNSo(h,g)) + HINTINCo(h) + sum(t,HEXINCo(h,t));
                          htr(g,h) = sam(g,h)/HHIo(h);
                          mps(h) = HSAVo(h)/HHIo(h);
                          mpsf(t,h) = FORSAVo(t,h)/HHIo(h);

EQHHX(c,h)$HHXo(c,h)..  HHX(c,h) =e= (HHID(h) / (PC(c)**sh(h) * (ah(c,h)*((sum(cc$ah(cc,h), PC(cc)**(1-sh(h)) * ah(cc,h)**(sh(h)-1)))**(1/(1-sh(h)))))**(1-sh(h))));
                        sh(h) = 0.9;
                        HHIDo(h) = HHIo(h)*(1-sum(g,htr(g,h))-mps(h)-sum(t,mpsf(t,h)));
                        ah(c,h)$HHXo(c,h) = ((HHXo(c,h)/HHIDo(h))**(1/(sh(h)-1)));
                        ah(c,h)$(HHXo(c,h)=0) = 0;

EQHHX2(c,h)$(HHXo(c,h)=0)..  HHX(c,h) =e= 0;

*-----------------------------------------------------Recreational Model ---------------------------------------------------------------*

* $include recreation.gms

set s species /smbass, whbass, perch, walleyes, lktrout, rbtrout, lwfish/;
alias (s,ss)

set d data /w2p, catch, fph, totdays, weight/;


parameter
smbasspr small mouth bass relative proportion of bass stock
whbasspr white bass relative proportion of bass stock
lktrpr lake trout relative proportion of trout
rbtrpr rainbot trout relative proportion of trout
;
smbasspr = 0.057964363/(0.511917007+0.057964363);
whbasspr = 0.511917007/(0.511917007+0.057964363);
lktrpr =0.023179717/(0.023179717+0.09863322);
rbtrpr =0.09863322/(0.023179717+0.09863322);

* MODIFIED MAY 2014 Original WTP, cactch, and fish per hour from Besedin et al (2004)
table besedina(*,*)
                w2p             catch           fph     totdays      weight
*               ($/fish)        (fish/yr)       (f/h)   (days/year)  (kg/fish)
  smbass        12.86           3048444         0.15    3944365       1.1
  whbass        12.86           3048444         0.15    3944365       1.1
  perch         2.47            10808297        0.758   4094568       0.17
  walleyes      18.43           1693872         0.081   4295665       1.5
  lktrout       20.13           1905185         0.129   8467817       2.7
  rbtrout       20.13           1905185         0.129   8467817       2.7
  lwfish        2.47            28885829        0.337   2335586       1.5
;
* other is not used in the model because Besedin find a near zero
* net welfare gain from `other' fishing trips
Parameter
smbcatch
whbcatch
smbdays
whbdays
lktrcatch
rbtrcatch
lktrdays
rbtrdays
;
smbcatch= smbasspr*besedina('smbass','catch');
whbcatch= whbasspr*besedina('whbass','catch');
smbdays=  smbasspr*besedina('smbass','totdays');
whbdays=  whbasspr*besedina('whbass','totdays');
lktrcatch=lktrpr*besedina('lktrout','catch');
rbtrcatch=rbtrpr*besedina('rbtrout','catch');
lktrdays= lktrpr*besedina('lktrout','totdays');
rbtrdays= rbtrpr*besedina('rbtrout','totdays');

Table besedin(s,d)
                w2p             catch           fph     totdays      weight
*               ($/fish)        (fish/yr)       (f/h)   (days/year)  (kg/fish)
  smbass        12.86           310066.4873     0.15    401193.3302  1.1
  whbass        12.86           2738377.513     0.15    3543171.67   1.1
  perch         2.47            10808297        0.758   4094568      0.17
  walleyes      18.43           1693872         0.081   4295665      1.5
  lktrout       20.13           362536.6092     0.129   1611336.255  2.7
  rbtrout       20.13           1542648.391     0.129   6856480.745  2.7
  lwfish        2.47            2888582.9        0.337   2335586     1.5
;


table bench(*,*)
* from EwE
                 catch              stck
*               (tonnes/yr)         (tonnes)
  smbass         402.2325954        939.4502943
  whbass         2859.892628        15827.87386
  perch          7991.133923        25842.44079
  walleyes       10795.86986        30238.91401
  lktrout        72.22422698        672.5452138
  rbtrout        601.2337191        1836.367566
  lwfish         609.1150537        3095.247805
;

parameters population IMPLAN population in Lake Erie geography /420800/
           avghhincome average angler income from Besedin /39151/
           avhour average hour per trip /3.79/
           tripcst trip cost /21.09/
           travcst travel cost /31.46/
           fishingpop population likely to fish in Lake Erie;

* Assume 10 percent of population fishes
* fishingpop = population * 0.1;
fishingpop = population;

positive variables

  WTP(s)         willingness to pay for one fish caught of species s
  EFFORT(s)      effort spent fishing for species s
  WAGE           time cost (price of effort)
  EC(s)          unit cost function
  EF             unit expenditure
  TRIP(s)        trips per species
  PS(s)          trip price by species
  PFISH          price of fishing composite
  PY             price of composite
  FISH           fishing composite
  Y              composite good
  E              unit expenditure
  INC            gross income
  CATCH(s)       catches
  NMV(s)         nonmarket value of time spent fishing
  TNMV           total nonmarket value from fishing
*  UTIL           indirect utility

;
equations

  eq_ec(s)       unit cost function
  eq_wtp(s)      wtp determination
  eq_effort(s)   demand for days fishing
  eq_ef,
  eq_trip(s)
  eq_ps(s),
  eq_pfish,
  eq_fish,
  eq_y,
  eq_e,
  eq_inc,
  eq_nmv(s),
  eq_catch(s),
  eq_tnmv
*  eq_util
;


parameters

  sige(s)        elasticity of substitution between effort and stock
  betae(s)       share of effort in benchmark
  STOCKtb(s)     baseline stock as given
  STOCKt(s)      stock as given

* benchmark data:

  ec0(s)         benchmark unit costs
  wtp0(s)        benchmark willingness to pay for species s
  stock0(s)      benchmark stock of species s on a per capita basis
  catch0(s)      benchmark catch of species s
  ps0(s)         benchmark shadow price for stock of species s
  wage0          benchmark wage /1/
  effort0(s)     benchmark hours fishing
  wage0          price of effort
  tripcap(s)     benchmark percapita trips
  tottrip        benchmark total trips
  tripcsts0(s)   benchmark trip costs
  travcsts0(s)   benchmark travel costs
  tripsum        benchmark trip cost total
  travsum        benchmark travel cost total
  tripprop       benchmark trip cost proportion of income
  travprop       benchmark travel cost proportion of income
  wbartrip0      benchmark trip cost per hour
  wbartrav0      benchmark travel cost per hour
  mktvaltrip0(s) benchmark market value of trip effort by species
  mktvaltrav0(s) benchmark market value of travel effort by species
  totmktvaltrip0 benchmark total market value of trip effort
  totmktvaltrav0 benchmark total market value of travel effort
  nmval0(s)      benchmark nonmarket value of catchable biomass by species
  totnmval0      benchmark total nonmarket value
  catchprop(s)   benchmark catch per stock
  totvalstrip0(s) benchmark total value by species
  totvalstrav0(s) benchmark total value by species
  totvaltrip0     benchmark total value of fishing inclusive of nmv
  totvaltrav0     benchmark total value of fishing inclusive of nmv
  theta_f(s)      share of species in benchmark fishing composite
  sig_fish        elasticity of substitution between species /0.9/
  efbar           benchmark unit expenditure function,
  eftst           benchmark test
  ps0(s)          benchmark price of trip by species
  trip0(s)        benchmark trips by species
  theta_u         share of fishing in benchmark
  sig_u           elasticity of substitution /0.9/
  py0             benchmark consumption price /1/
  pf0             benchmark fishing composite price
  inc0            benchmark household income + value of fishing
  f0              benchmark demand for fishing composite
  y0              benchmark consumption composite
  ebar            benchmark unit expenditure
  vbar            benchmark indirect utility
  exc(s)          non-market devaluation
;

  wtp0(s)    = besedin(s,'w2p');
  stock0(s)  = besedin(s,'catch') * (bench(s,'stck')/bench(s,'catch')) / fishingpop;
*  stock0(s)  = bench(s,'stck') / (fishingpop * (bench(s,'totdays')/sum(ss,bench(ss,'totdays'))));
  catch0(s)  = besedin(s,'catch') / fishingpop;
*  catch0(s)  = bench(s,'catch') / (fishingpop * (bench(s,'totdays')/sum(ss,bench(ss,'totdays'))));
*  effort0(s) = .2 * ((bench(s,'catch') * 1000000 / bench(s,'weight'))/bench(s,'fph')) / fishingpop;
effort0(s) = catch0(s) / besedin(s,'fph');
tripcap(s) = besedin(s,'totdays')/fishingpop;
tottrip = sum(s,tripcap(s));
tripcsts0(s) = tripcst*tripcap(s);
travcsts0(s) = travcst*tripcap(s);
tripsum  = sum(s, tripcsts0(s));
travsum  = sum(s, travcsts0(s));
tripprop = tripsum/avghhincome;
travprop = travsum/avghhincome;
wbartrip0 =tripcst/avhour;
wbartrav0 =travcst/avhour;
mktvaltrip0(s)= wbartrip0*effort0(s);
mktvaltrav0(s)=wbartrav0*effort0(s);
totmktvaltrip0=sum(s,mktvaltrip0(s));
totmktvaltrav0=sum(s,mktvaltrav0(s));
catchprop(s)= (bench(s,'catch')/bench(s,'stck'));
nmval0(s) =wtp0(s)*stock0(s)*catchprop(s);
totnmval0=sum(s,nmval0(s));
totvalstrip0(s)= mktvaltrip0(s)+nmval0(s);
totvalstrav0(s)= mktvaltrav0(s)+nmval0(s);
totvaltrip0= sum(s,totvalstrip0(s));
totvaltrav0= sum(s,totvalstrav0(s));




  wage0 = 1;

  sige(s) = .3;
*choosing travel value from here on
  betae(s) = mktvaltrav0(s)/totvalstrav0(s);
  trip0(s)=travcsts0(s);
   ec0(s) =totvalstrav0(s)/trip0(s);
  exc(s) = 1/ec0(s);

Display
sige
betae
wtp0
ec0
exc
;

  theta_f(s) = travcsts0(s) /travsum ;
  efbar=1;
  eftst = efbar*((sum(ss,(theta_f(ss)*(wtp0(ss)/wtp0(ss))**(1-sig_fish))))**(1/(1-sig_fish)));
  ps0(s)=ec0(s)*exc(s);
*  trip0(s)=mktvaltrav0(s);
*  catchtst(s) = catch0(s)*((wtp0(s)/wtp0(s))**(-sig_fish))*((eftst/efbar)**(sig_fish-1))*(totvaltrav0/totvaltrav0);


Display
theta_f
eftst
ps0
trip0
*catchtst
;

  pf0= efbar;
  f0 = travsum;
  y0 = avghhincome-travsum;
  inc0 = sum(h,HHIDo(h));
  theta_u  = travsum/inc0;
  ebar=1;
  vbar=inc0/ebar;

  STOCKt(s)= stock0(s);


display wbartrav0;

* -- NOTE: changed this
eq_ec(s) .. EC(s) =e= ec0(s)*(betae(s)*((PF('lab')*wbartrav0/wbartrav0)**(1-sige(s)))+(1-betae(s))*((WTP(s)/wtp0(s))**(1-sige(s))))**(1/(1-sige(s)));
*the totvalstrav0(s) in the last bracket numerator will have to be replaced with PS(s)*FS(s) etc

eq_wtp(s).. STOCKt(s)*catchprop(s)=e=stock0(s)*catchprop(s)*(((EC(s)*wtp0(s))/(ec0(s)*WTP(s)))**(sige(s)))*(TRIP(s)/trip0(s));

* -- NOTE:changed this
eq_effort(s)..  EFFORT(s) =e= effort0(s)*(((EC(s)*1)/(ec0(s)*PF('lab')))**(sige(s)))*(TRIP(s)/trip0(s));
*(((EC(s)*wbartrav0)/ex0)**(sige(s)))*((WAGE/wbartrav0)**(-sige(s)))*((TRIP(s)*PS(s)+WTP(s)*STOCKt(s)*catchprop(s))/totvalstrav0(s));;

* -- 2. Given the willingness to pay for each species and effort directed at each, the representative agent
*    maximizes the utility from trips fishing for each species
* --NOTE trips here are in value terms, and this value includes NMV


  eq_ef .. EF =e= efbar*((sum(ss,(theta_f(ss)*(PS(ss)/ps0(ss))**(1-sig_fish))))**(1/(1-sig_fish)));
*totvaltrav0 below will have to be updated to be the value of fishing composite from next nest

display travsum;

  eq_trip(s) .. TRIP(s) =e=  trip0(s)*((PS(s)/ps0(s))**(-sig_fish))*((ef/efbar)**(sig_fish-1))*((PFISH*FISH)/travsum);
  eq_ps(s) .. PS(s) =e= EC(s)*exc(s);

*  eq_vf .. vf =e= (sum(s,((theta_f(s)*((efbar/WTP(s))**(1-sig_fish)))**(1/sig_fish))*((CATCH(s))**((sig_fish-1)/sig_fish))))**(sig_fish/(sig_fish-1));
*  eq_incf .. incf =e=vf*ef;

* -- 3. choice between fishing trips and other goods

* Think I have a problem with income as the wtp is sky rocketing making the TNMV fly up and this is artificially increasing income - the individual however should be more constrained!!
eq_PFISH .. PFISH =e= EF;

eq_e .. E =e= ebar*(theta_u*((PFISH/efbar)**(1-sig_u))+(1-theta_u)*((PY/py0)**(1-sig_u)))**(1/(1-sig_u));

eq_fish .. FISH =e= f0*((E/ebar)**(sig_u-1))*((PFISH/efbar)**(-sig_u))*(INC/inc0);

* eq_y .. Y =e= y0*((E/ebar)**(sig_u-1))*((PY/py0)**(-sig_u))*(INC/inc0);

eq_catch(s) ..  CATCH(s) =e=EFFORT(s)*besedin(s,'fph');

eq_nmv(s) .. NMV(s) =e= WTP(s)*EFFORT(s)*besedin(s,'fph');

eq_tnmv .. TNMV =e=sum(s,  NMV(s));

eq_inc .. INC =e= sum(h, HHID(h));



equation eq_py;

  eq_py .. PY =e= ((sum(cc$ah(cc,'hhd1'), PC(cc)**(1-sh('hhd1')) * ah(cc,'hhd1')**(sh('hhd1')-1)))**(1/(1-sh('hhd1'))));

$ontext
-- SAVINGS AND INVESTMENT

Savings and investment are represented by the 'inv' entries in the SAM. Reading across the 'inv' row,
inventory is available to be added to the total supply pool, factors earn rents or profits that are added
to the total amount of investments available, and households and governments save. The (inv,inv) entry in
the SAM represents inventory or investment adjustments but does have a large role to play in the model.
Reading down the 'inv' column, a portion of total output is added to inventory or IT investments, households
earn interest income from investments, governments levy an enterprise tax on investments and inventories, and
again are inventory adjustments.

Agents' behavior with regard to investments, inventory, and savings are assumed to by myopic. That is, they
occur as fixed portions of some other economic activity and not as results of optimization problems. This has
modeling implications which one may want to change depending on the problem of interest. For example, households
save a fixed percentage of total income, not after-tax income. Any affect changes in tax rates have on household
savings behavior will not be captured by this model. One the other hand, increases in government transfers to
housholds increase total income, of which a certain percentage of is saved. Because of the difference in effects
of the two government actions, this may be a worthy change for future models (one that would require more
background reading on influence of taxes on household behavior).

Government additions to inventory are assume to be fixed.

There are trade entries in the 'inv' column and row of the SAM corresponding to exogenous savings and interest
payments to the rest of the world. These are fixed in the model and so will not play a part in this section.
It should be noted that these also do not play a role in the goverments' tax rates for enterprise taxes.

Because savings and investment decisions are based on total levels of economic activity, those levels are first
determined
$offtext

parameter
        QDo(c)         domestically supplied goods
        armd(c)        calibrated Armington coefficient for domestic good
        armf(t,c)      calibrated Armington coefficient for foreign goods
        AC(c)          calibrated Armington coefficient
        rc(c)          parameter for Armington mix based on elasticity of substitution
        sc(c)          elasticity of substitution between domestic and foreign goods;

        sc(c)      = scvalues(c);

parameter
        XDo(c)         domestically demanded goods
        cetd(c)        calibrated CET share parameter for domestic demand
        cetf(c,t)      calibrated CET share parameter for trade partners
        AT(c)          calibrated CET efficiency parameter
        rt(c)          parameter for CET based on elasticity of substitution
        st(c)          elasticity of substitution between domestic and foreign consumption goods;

        st(c)       = stvalues(c);

parameters       Qo(c)           total supply
                 Xo(c)           total demand;

parameters
        ainv(c)         share of total supply represented by inventory
        arent(f)        portion of factors that go to rents
        ait(c)          share of output that goes to IT
        entaxr(g)       goverment enterprise tax rate;

        Qo(c)           = sum(a$(ord(a)=ord(c)),DYo(a)) + sum(g,sam(g,c)) + QINVo(c) + sum(t,QIMPo(t,c));
        Xo(c)           = sum(a,Vo(c,a)) + sum(h,HHXo(c,h)) + sum(g,sam(c,g)) + ITo(c) + sum(t,XEo(c,t));


equations EQQINV(c), EQIT(c), EQRENT(f);
variables QINV(c), IT(c), RENT(f);

     EQQINV(c)..   QINV(c) =e= ainv(c) * Q(c);
                               ainv(c) = QINVo(c)/Qo(c);

     EQIT(c)..     IT(c) =e= ait(c) * X(c);
                             ait(c) = ITo(c)/Xo(c);

     EQRENT(f)..   RENT(f) =e= arent(f) * FACPMT(f);
                               arent(f) = RENTo(f)/FACPMTo(f);
$ontext

-- GOVERNMENT

The government taxes final goods and factors of production, provides goods in some industries, and consumes
goods from some inustries. All its actions are myopic and occur as some fixed portion of other quantities in
the model. Government supply QGOV(i) is a constant proportion of total domestic supply, government demand is
a fixed proportion of total domestic demand, and the tax rates are fixed.

The SAM does not distinguish between business taxes distributed to the various levels of government but does
spread the business taxes to various levels of government, implying different tax rates for different levels
of government. We could distribute the revenues according to the share represented in this column. Instead we
assume that after all business taxes are collected, they are distributed to the levels of goverment based on
the shares in the IBT column. Because the SAM is linear, this method is akin to explicitly stating separate
tax rates but has the advantage of being more reflective of the SAM and more straightforward for analysis.

Government to government transfers are also allowed.

The government maintains a balanced budget such that BRW = Government Revenues - Government Expenses = 0;

$offtext

parameters
        ags(g,c)        share of good i supplied by government
        agx(c,g)        share of good i consumed by government
        ftr(g,f)        factor tax rate
        aibt(g)         share of bussiness taxes to government agents
        gmps(g)         government marginal propensity to save
        GGo(g,gg)       government to government transfers
        GREVo(g)        government revenues
        BRWo(g)         net government borrowing -- deficit minus aid for all trade partners;

        ftr(g,f)        = sam(g,f)/FACPMTo(f);

        ags(g,c)        = QGOVo(g,c)/Qo(c);
        agx(c,g)        = XGOVo(c,g)/Xo(c);

        QGOVo(g,c)      = ags(g,c) * Qo(c);
        XGOVo(c,g)      = agx(c,g) * Xo(c);

        aibt(g)         = sam(g,'indt')/sum(gg,sam(gg,'indt'));

        GGo(g,gg)       = sam(g,gg);

        entaxr(g)       = ENTAXo(g) / (sum(c,QINVo(c)) + sum(f,RENTo(f)) + sum(h,HSAVo(h))
                          + sum(gg,GSAVo(gg)) + INVADJo);

        GREVo(g)        = sum(c,QGOVo(g,c)*1) + aibt(g)*sum(a,ibtr(a)*DYo(a)) + sum(h,HHIo(h)*htr(g,h))
                          + sum(gg,GGo(g,gg)) + sum(f,FACPMTo(f)*ftr(g,f))
                          + entaxr(g)* (sum(c,QINVo(c)) + sum(f,RENTo(f)) + sum(h,HSAVo(h)) + sum(gg,GSAVo(gg))
                          + INVADJo);

        gmps(g)         = GSAVo(g)/GREVo(g);

        BRWo(g)         = sum(c,XGOVo(c,g)*1) + sum(h,HTRNSo(h,g)) + sum(gg,GGo(gg,g)) + GSAVo(g) - GREVo(g);

variables        QGOV(g,c), XGOV(c,g), BRW(g), GREV(g), GSAV(g);
                 HTRNS.fx(h,g) = HTRNSo(h,g);

equations        EQQGOV(g,c), EQXGOV(c,g), EQBRW(g), EQGREV(g), EQGSAV(g);

     EQQGOV(g,c)..   QGOV(g,c) =e= ags(g,c)*Q(c);

     EQXGOV(c,g)..   XGOV(c,g) =e= agx(c,g)*X(c);

     EQGSAV(g)..     GSAV(g) =e= gmps(g)*GREV(g);

     EQGREV(g)..     GREV(g) =e= sum(c,QGOV(g,c)*1) + sum(a,aibt(g)*ibtr(a)*DY(a))
                                    + sum(h,HHI(h)*htr(g,h)) + sum(gg,GGo(g,gg)) + sum(f,FACPMT(f)*ftr(g,f))
                                    + entaxr(g)* (sum(c,QINV(c)) + sum(f,RENT(f)) + sum(h,HHI(h)*mps(h))
                                    + sum(gg,GSAV(gg)) + INVADJo);

     EQBRW(g)..      BRW(g) =e= sum(c,PC(c)*XGOV(c,g)) + sum(h,HTRNS(h,g)) + sum(gg,GGo(gg,g))
                                   + GSAV(g) - GREV(g);


$ontext

-- TRADE ---------------

Total supply is made up of imports and exports determined by Armington assumptions. The decision is made by minimizing cost of obtaining the good subject
to CES preferences for domestic and foreign goods. Let total supply of the commodity be given by

        Q = AC*(arm*QD**rc + (1-arm)*QIMP**rc)**1/rc

By rewriting

        Astar = A/AC = (arm1*Q1**rc + arm2*Q2**rc + .. armN*QN**rc)**1/rc

we can use a similar calibration as found in the demand section for N trading partners. Exports are determined in a similiar manner.
$offtext

variables PM(c) import and export price for good c
          QIMP(t,c) imports
          QD(c) domestic supply
          XE(c,t) exports to trade partner t
          XD(c) domestic demand;

* The international price is set as our numeraire
    PM.fx(c)=1;

        QDo(c)     = sum(a$(ord(a)=ord(c)),DYo(a)) + sum(g,QGOVo(g,c)) + QINVo(c);

        XDo(c)      = sum(a,Vo(c,a)) + sum(h,HHXo(c,h)) + sum(g,XGOVo(c,g)) + ITo(c);
        rt(c)       = 1 - 1/st(c);

        AT(c)       = 1;

        cetd(c)     = ((Xo(c) /XDo(c)    )**(rt(c)/(1-st(c))));
        cetf(c,t)   = ((Xo(c) /XEo(c,t))**(rt(c)/(1-st(c))))$XEo(c,t);

equations EQQD(c), EQQIMP(t,c), EQX(c), EQXE(c,t);

EQQIMP(t,c)..   QIMP(t,c) =e= (armf(t,c)/PM(c))**sc(c) * (Q(c)/AC(c)) / (PD(c)*(armd(c)/PD(c))**sc(c)
                                    + sum(tt,PM(c)*(armf(tt,c)/PM(c))**sc(c)));
                                    rc(c) = 1 - 1/sc(c);
                                    armd(c)    = ((Qo(c) /QDo(c)    )**(rc(c)/(1-sc(c))))$QDo(c);
                                    armf(t,c)  = ((Qo(c)/QIMPo(t,c))**(rc(c)/(1-sc(c))))$QIMPo(t,c);

EQQD(c)..        Q(c)=e= AC(c) * (armd(c)*QD(c)**rc(c) + sum(t,armf(t,c)*QIMP(t,c)**rc(c)))**(1/rc(c));
                        AC(c) = 1;

        EQXE(c,t).. XE(c,t) =e= (cetf(c,t)/PM(c))**st(c) * (X(c)/AT(c)) / (PD(c)*(cetd(c)/PD(c))**st(c)
                                    + sum(tt,PM(c)*(cetf(c,tt)/PM(c))**st(c)));

        EQX(c)..  X(c) =e= AT(c) * (cetd(c)*XD(c)**rt(c) + sum(t,cetf(c,t)*XE(c,t)**rt(c)))**(1/rt(c));

*      eqXE(c,t)..     XE(c,t) =e= XEo(c,t)*(PM(c)/PD(c))**st(c);

*      eqX(c)..        X(c) =e= XD(c) + sum(t,XE(c,t));

$ontext
-- EQUILIBRIUM ---------

Domestic prices PD(i) adjust until total supply Q(i) equals total demand X(i). Firms are the only supplier;
demand consists of demand for intermediate inputs for production and household consumption. The firm is also
assumed to have zero profits. Prices of factors PF(f) adjust until supply of factors equals demand.

Key to equilibrium in a CGE model is the idea of closure. Closure refers to parts of the model that are held
constant that other variables adjust to in the model, much like a numeraire. For example, our treatment of
savings uses marginal propensity to save for households, firms, and government. This 'closes' the amount of
savings in the model. An alternative savings closure would involve fixing the interest rate. Factor markets
are closed in the model by specifying a fixed supply. The price factors earn in the market adjusts so factor
demand equals the inelastic supply.

With the introduction of trade, special attention should be paid to closure rules with the outside world. The
factor markets are closed by specifying a fixed percentage of factor payments that go to the rest of the world.
Similarly, household were assumed to have fixed marginal propensities to save in foreign markets and received
fixed amounts of income from the rest of the world. Because all other government behaviors are fixed percentages
of other economic activity, net government borrowing adjusts to maintain the government balanced budget
constraint and close the government accounts. Import prices are assumed to be constant (thus the exchange rate
is flexible), around which imports and exports adjust to maintain balanced capital accounts through Armington
assumptions.
$offtext

equations eqQ(c), EQXD(c), EQPC(c), eqPD(a), EQPDF(tac), EQPROF(tac),  EQPDT(tac) ;

EQPD(a).. PI(a) =e= CV(a) - DY(a)*PD(a);
           PI.fx(a) = 0;


equations eqPC(c) goods market clearing conditions determine domestic prices;

eqQ(c).. Q(c) =e= X(c);

eqDY(c).. QD(c) =e= DY(c) + sum(g,QGOV(g,c)) + QINV(c);

EQXD(c).. XD(c) =e= sum(h,HHX(c,h)) + sum(a,V(c,a)) + sum(g,XGOV(c,g)) + IT(c);

EQPDT(tac).. PC(tac)*Q(tac) =e= PD(tac)*QD(tac) + PM(tac)*(sum(t,QIMP(t,tac)));

eqPC(c).. PC(c)*Q(c) =e= PD(c)*QD(c) + sum(t,PM(c)*QIMP(t,c));

* eqDY(c)..     DY(c) =e= sum(a,V(a,c)) + VA(c) + TAX(c);

* eqDY(a).. DY(a) =e= alphaeffort(a) * PD(a) * TQ(a) / EXPENDF(a);

* EQEXPENDF(a)..  EXPENDF(a) =e= ava(a)*PVA(a) + sum(c, aint(c,a)*PC(c)) + ibtr(a);


* Equilibrium
equations EQPF(f);

EQPF(f)..        sum(a,FACo(f,a)) =e= sum(a,FAC(f,a));

* ---- Initialize variables -----------------------------------


parameters CVo(a)          total costs;

CVo(a) = sum(c,aint(c,a)*DYo(a)) + (VAo(a)*
         (sum(f$tva(f,a),(1/tva(f,a))**eta(a)))**(1/eta(a)))$VAo(a) + ibtr(a)*DYo(a);

        HHI.l(h) = HHIo(h);        HHID.l(h) = HHIDo(h);     HHX.l(c,h) = HHXo(c,h);       CV.l(a) = CVo(a);
        V.l(c,a) = Vo(c,a);        VA.l(a) = VAo(a);         DY.l(a) = DYo(a);             DYF.l(tac) = DYFo(tac);  Q.l(c) = Qo(c);
        X.l(c) = Xo(c);            PD.l(a) = 1;              PF.l(f) = 1;                  FAC.l(f,a) = FACo(f,a);
        PC.l(c)=1;                 FACPMT.l(f) = FACPMTo(f); QGOV.l(g,c)=QGOVo(g,c);
        XGOV.l(c,g) = XGOVo(c,g);  BRW.l(g)=BRWo(g);
        QINV.l(c)=QINVo(c);        IT.l(c)=ITo(c);           RENT.l(f)=RENTo(f);           GREV.l(g)=GREVo(g);
        GSAV.l(g)=GSAVo(g);        QD.l(c)=QDo(c);           QIMP.l(t,c)=QIMPo(t,c);       XD.l(c)=XDo(c);
        XE.l(c,t)=XEo(c,t);        TQ.l(a) =TQo(a);

        TAX.l(c) = sam('indt',c);
        CATCH.l(s) = catch0(s);
        WTP.l(s) = wtp0(s);
        PS.l(s) = ps0(s);
        EFFORT.l(s) = effort0(s);
        PFish.l = 1;
        EXPENDF.l(a) = 1;

* STOCK.l(s) = STOCK0(s);
*  COST.l(s,h) = cost0(s,h);
*  WAGE.fx(h) = wage0(h);
*  XF.l(h) = HHXo('rfish',h);
*  UTILF.l(h) = 1;
*  INCF.l(h) = INCF0(h);

parameter INCo;
INCo = sum(h, HHIDo(h));
E.l=ebar;
CATCH.l(s)= effort0(s)*besedin(s,'fph');
NMV.l(s) = wtp0(s)*effort0(s)*besedin(s,'fph');
TNMV.l=sum(s,wtp0(s)*effort0(s)*besedin(s,'fph'));
INC.l= INCo;
*util.l=vbar;
EC.l(s)=ec0(s);
EFFORT.l(s)=effort0(s);
WTP.l(s)= wtp0(s);
WAGE.fx = wbartrav0;
EF.l= efbar;
TRIP.l(s)=trip0(s);
PS.l(s)=ps0(s);

PY.l = ((sum((cc)$ah(cc,'hhd1'), 1**(1-sh('hhd1')) * ah(cc,'hhd1')**(sh('hhd1')-1)))**(1/(1-sh('hhd1'))));
FISH.l = f0;
PVA.l(a) = 1;



model   cge /
        EQFACPMT.FACPMT
        EQHHI.HHI
        EQHHID.HHID
        EQHHX.HHX
        EQV.V
        EQVA.VA
        EQFAC.FAC
        EQCV.CV
        eqTAX.TAX
        EQDY.DY
        EQQ.Q
        EQX.X
        EQPD.PD
        EQPF.PF
        eqPVA.PVA
*         eqTQ.TQ

        EQQGOV.QGOV
        EQXGOV.XGOV
        EQBRW.BRW
        EQQINV.QINV
        EQIT.IT
        EQRENT.RENT
        EQGREV.GREV
        EQGSAV.GSAV
        EQQD.QD
        EQQIMP.QIMP
        EQXD.XD
        EQXE.XE
        eqPC.PC
        EQHHX2.HHX
*        EQEXPENDF.EXPENDF
*        EQTACW1.DY
*        EQTACW2.DY
*        EQTACW3.DY
*        EQTACW4.DY
*        EQTACYP.DY
*        EQPDT.pd
        eq_ec.ec
        eq_wtp.wtp
        eq_effort.effort
        eq_ef.ef
        eq_trip.trip
        eq_ps.ps
        eq_pfish.pfish
        eq_fish.FISH
        eq_e.e
        eq_nmv.nmv
        eq_catch.catch
        eq_tnmv.tnmv
        eq_py.py
*       eq_y,
        eq_inc.INC
/;

* replicate benchmark

    options iterlim = 0;
    solve cge using mcp;

* -------- Counterfactuals ----------------------------------------------

options iterlim = 9999;
solve cge using mcp;

parameter tq2dy(a);

tq2dy(a) = DYo(a) / TQo(a);




* Interactions with EwE

parameter ewe(*) percent change in biomass from EwE
/
$include stock_in.txt
/;

display ewe;

* set shock to rec and commercial

j(a) = 1;
j('wall') = ewe('WAE-A');
j('yperch')= ewe('YEP-A');
j('wperch') = ewe('WHP');
j('wbass') = ewe('WHB');

*** TAC ---

stockt('walleyes') = ewe('WAE-A');
stockt('perch') = ewe('YEP-A');
stockt('whbass') = ewe('WHB');
stockt('smbass') = ewe('SMB');
stockt('lktrout') = ewe('LKT');
stockt('rbtrout') = ewe('RAS');
stockt('lwfish') = ewe('LWF');


$ontext
DY.up('wall')$((J('wall')*bio('wall')> 2.555710956) and (wally('wall')=1)) = tq2dy('wall') / (  0.5694*0.35*(J('wall')*bio('wall'))  );

DY.up('wall')$((0.987412587<=J('wall')*bio('wall')) and (J('wall')*bio('wall')< 1.332556333)and (wally('wall')=1))
                           = tq2dy('wall') / (  0.5694*((J('wall')*bio('wall'))*(0.02*(J('wall')*bio('wall'))+.08))  );

DY.up('wall')$((1.332556333<=J('wall')*bio('wall')) and (J('wall')*bio('wall')<= 2.555710956)and (wally('wall')=1))
                = tq2dy('wall') / (  0.5694*((J('wall')*bio('wall'))*(0.1128*(J('wall')*bio('wall'))+0.05))  );

DY.up('wall')$((J('wall')*bio('wall')< 0.987412587) and (wally('wall')=1)) = tq2dy('wall') / (  0.5694*0.1*(J('wall')*bio('wall'))  );

DY.up('yperch')$(wally('yperch')=2) = tq2dy('yperch') / (  0.52678*(0.07837 + 0.09919*(J('yperch')*bio('yperch')))  );

$offtext


* $ontext
DY.fx('wall')$((J('wall')*bio('wall')> 2.555710956) and (wally('wall')=1)) = tq2dy('wall') / (  0.5694*0.35*(J('wall')*bio('wall'))  );

DY.fx('wall')$((0.987412587<=J('wall')*bio('wall')) and (J('wall')*bio('wall')< 1.332556333)and (wally('wall')=1))
                           = tq2dy('wall') / (  0.5694*((J('wall')*bio('wall'))*(0.02*(J('wall')*bio('wall'))+.08))  );

DY.fx('wall')$((1.332556333<=J('wall')*bio('wall')) and (J('wall')*bio('wall')<= 2.555710956)and (wally('wall')=1))
                = tq2dy('wall') / (  0.5694*((J('wall')*bio('wall'))*(0.1128*(J('wall')*bio('wall'))+0.05))  );

DY.fx('wall')$((J('wall')*bio('wall')< 0.987412587) and (wally('wall')=1)) = tq2dy('wall') / (  0.5694*0.1*(J('wall')*bio('wall'))  );

DY.fx('yperch')$(wally('yperch')=2) = tq2dy('yperch') / (  0.52678*(0.07837 + 0.09919*(J('yperch')*bio('yperch')))  );

* $offtext




*DY.fx(walleye)$((J(walleye)*bio(walleye)> 2.555710956) and (wally(walleye)=1)) = tq2dy(walleye) / (  0.5694*0.35*(J(walleye)*bio(walleye))  );

*DY.fx(walleye)$((0.987412587<=J(walleye)*bio(walleye)) and (J(walleye)*bio(walleye)< 1.332556333)and (wally(walleye)=1))
*                           = tq2dy(walleye) / (  0.5694*((J(walleye)*bio(walleye))*(0.02*(J(walleye)*bio(walleye))+.08))  );

*DY.fx(walleye)$((1.332556333<=J(walleye)*bio(walleye)) and (J(walleye)*bio(walleye)<= 2.555710956)and (wally(walleye)=1))
*                = tq2dy(walleye) / (  0.5694*((J(walleye)*bio(walleye))*(0.1128*(J(walleye)*bio(walleye))+0.05))  );

*DY.fx(walleye)$((J(walleye)*bio(walleye)< 0.987412587) and (wally(walleye)=1)) = tq2dy(walleye) / (  0.5694*0.1*(J(walleye)*bio(walleye))  );

*DY.fx(yp)$(wally(yp)=2) = tq2dy(yp) / (  0.52678*(0.07837 + 0.09919*(J(yp)*bio(yp)))  );

* ---------------



* solve cge using mcp;

* write catch to text file to be used by EwE

parameter deltacatch(*) percent change in total catch;

deltacatch('walleyes') = ( (0.07/(0.07+0.09)) * CATCH.l('walleyes') + (0.09/(0.07+0.09)) * DY.l('wall')) / ((0.07/(0.07+0.09)) * CATCH0('walleyes') + (0.09/(0.07+0.09)) * DYo('wall'));
deltacatch('yperch') = ((0.07/(0.07+0.11)) * CATCH.l('perch') + (0.11/(0.07+0.11)) *DY.l('yperch')) / ((0.07/(0.07+0.11)) * CATCH0('perch') + (0.11/(0.07+0.11)) *DYo('yperch'));
deltacatch('salmon') = 1;
* CATCH.l('salmon') / CATCH0('salmon');
deltacatch('bass') = 1;
* CATCH.l('bass') / CATCH0('bass');

deltacatch('smelt') = DY.l('smelt') / DYo('smelt');
deltacatch('wperch') = DY.l('wperch') / DYo('wperch');
deltacatch('ccat') = DY.l('ccat') / DYo('ccat');


file catch_out /catch_out.txt/;
catch_out.pc = 4; catch_out.nd = 5;
put catch_out;

put "ModelStatus", cge.modelstat:2:0/;
put "SolverStatus", cge.solvestat:2:0/;
put 'WAE-Y',    ewe('WAE-Y') /;
put 'WAE-A',    ewe('WAE-A') /;
put 'YEP-A',    ewe('YEP-A') /;
put 'LWF',      ewe('LWF') /;
put 'WHB',      ewe('WHB') /;
put 'WHP',      ewe('WHP') /;
put 'BUT',      ewe('BUT') /;
put 'RAS',      ewe('RAS') /;
put 'SMB',      ewe('SMB') /;
put 'RAT-A',    ewe('RAT-A') /;
put 'LKT',      ewe('LKT') /;
put 'SUK',      ewe('SUK') /;
put 'CAT',      ewe('CAT') /;
put 'PanF',     ewe('PanF') /;

putclose catch_out;

file econ_out /econ_out.txt/;
econ_out.pc = 4; econ_out.nd = 5;
put econ_out;

loop(c, put 'Price', c.tl, PD.l(c) /;);
loop(c, put 'DY', c.tl, DY.l(c) /;);

putclose econ_out;



$exit


