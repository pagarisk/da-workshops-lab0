# da-workshops-lab0
Это первая лабораторная работа по курсу лекций Николая Павлова "Data Analysis with R".

## Часть 1
Загружаем данные с помощью source():
```r
source("http://www.openintro.org/stat/data/arbuthnot.R")
```

### Задача 1
Смотрим на количество девочек в первом датасете:
```r
arbuthnot$girls
```
Получаем результат в виде вектора:
```r
[1] 4683 4457 4102 4590 4839 4820 4928 4605 4457 4952 4784 5332 5200 4910 4617 3997 3919 3395 3536 3181 2746 2722
[23] 2840 2908 2959 3179 3349 3382 3289 3013 2781 3247 4107 4803 4881 5681 4858 4319 5322 5560 5829 5719 6061 6120
[45] 5822 5738 5717 5847 6203 6033 6041 6299 6533 6744 7158 7127 7246 7119 7214 7101 7167 7302 7392 7316 7483 6647
[67] 6713 7229 7767 7626 7452 7061 7514 7656 7683 5738 7779 7417 7687 7623 7380 7288
```
Ваши числа в квадратных скобках могут отличаться - это id первого элемента вектора после переноса строки в векторе. В моем случае в одну строку консоли поместилось 22 значения.

### Задача 2
Строим график зависимости **girls** от **year** с помощью такой команды:
```r
plot(girls ~ year, data = arbuthnot)
```
Получаем такой результат:
![arbethnot girls plot][arb_girls_plot]

### Задача 3
Строим график зависимости **доли мальчиков** от **year**. Долю рассчитываем *inline*, передавая формулу в параметр функции:
```r
plot((boys / (boys + girls)) ~ year, data = arbuthnot, ylim = c(0, 1), ylab = "proportion of boys, arbuthnot")
```
Получаем следующий результат:
![arbethnot boys proportion plot][arb_boys_plot]

## Часть 2
Снова загружаем данные с помощью source():
```r
source("http://www.openintro.org/stat/data/present.R")
```
### Задача 1
Изучаем данные:
```r
present$year   #  list all years in the dataset
dim(present)   #  show dataset's dimensions
names(present) #  show the column names (variables)
```
Получаем следующи output в консоли:
```r
> present$year   #  list all years in the dataset
 [1] 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961
[23] 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983
[45] 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002
> dim(present)   #  show dataset's dimensions
[1] 63  3
> names(present) #  show the column names (variables)
[1] "year"  "boys"  "girls"
```
### Задача 2
Смотрим на структуру обоих наборов данных:
```r
str(arbuthnot) #  look at the first dataset's structure
str(present)   #  look at the second dataset's structure
```
Получаем следующий output в консоли:
```r
> str(arbuthnot) #  look at the first dataset's structure
'data.frame':	82 obs. of  3 variables:
 $ year : int  1629 1630 1631 1632 1633 1634 1635 1636 1637 1638 ...
 $ boys : int  5218 4858 4422 4994 5158 5035 5106 4917 4703 5359 ...
 $ girls: int  4683 4457 4102 4590 4839 4820 4928 4605 4457 4952 ...
> str(present)   #  look at the second dataset's structure
'data.frame':	63 obs. of  3 variables:
 $ year : num  1940 1941 1942 1943 1944 ...
 $ boys : num  1211684 1289734 1444365 1508959 1435301 ...
 $ girls: num  1148715 1223693 1364631 1427901 1359499 ...
```
Видим, что порядки значений во втором наборе данных значительно выше. Если нам интересно, насколько, то мы выполняем команду:
```r
> mean(c(mean(present$boys), mean(present$girls))) / mean(c(mean(arbuthnot$boys), mean(arbuthnot$girls)))
> [1] 321.5869
```
Получаем, что среднее значение в первом наборе данных в 321 раз меньше, чем во втором.

Как вариант, можно воспользоваться функцией **colMeans()** и получить коэффициенты для каждой колонки отдельно:
```r
> colMeans(present) / colMeans(arbuthnot)
      year       boys      girls 
  1.180593 319.209155 324.124597 
```


### Задача 3
Снова строим график зависимости **доли мальчиков** от **year**. Долю также рассчитываем *inline*, как и в предыдущий раз:
```r
plot((boys / (boys + girls)) ~ year, data = present, ylab = "proportion of boys, arbuthnot")
```
Получаем следующий результат:
![arbethnot boys proportion plot][present_boys_plot]

### Задача 4
Чтобы узнать год с наибольшим количеством рожденных детей, нужно посчитать сумму **boys + girls** для каждого года. Потом вывести в консоль ту строку *data frame*'а, которая содержит максимальное суммарное значение:
```r
present$total = present$boys + present$girls   #  calculate the total for every year
present[present$total == max(present$total), ] #  show the row with most total births
```
В консоли результат получаем следующий:
```r
> present$total = present$boys + present$girls   #  calculate the total for every year
> present[present$total == max(present$total), ] #  show the row with most total births
   year    boys   girls   total
22 1961 2186274 2082052 4268326
```

Еще один способ добиться того же результата - функция **which.max()**:
```r
> which.max(present$boys + present$girls)                   #   alternative one-liner, shows row number only
[1] 22
> present[which.max(present$boys + present$girls), "year"]  #   show the year with most births
[1] 1961
```

[arb_girls_plot]: https://github.com/pagarisk/da-workshops-lab1/blob/master/arbuthnot_girls.png?raw=true
[arb_boys_plot]: https://github.com/pagarisk/da-workshops-lab1/blob/master/arbuthnot_boys_proportion.png?raw=true
[present_boys_plot]: https://github.com/pagarisk/da-workshops-lab1/blob/master/present_boys_proportion.png?raw=true
