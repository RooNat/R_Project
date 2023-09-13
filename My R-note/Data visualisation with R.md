---
title: "Data visualisation with R"
author: "YujieWang"
tags: R
Week: 2
type: lecture
Lecture: 6
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
## Visual cues
Visual cues are components of a plot or graph which draw the attention of your audience.
1. **Position (numerical)**: Where in relation to other things?
2. **Length (numerical)**: How large (in one dimension)?
3. **Angle (numerical)**: How wide is
4. **Direction (numerical)**: At what slope?
5. **Shape (numerical)**: Which group?
6. **Area (numerical)**: How big (in two dimensions)?
7. **Volume (numerical)**: How big (in three dimensions)?
8. **Shade (numerical or categorical)**: How dark is something?
9. **Colour (numerical or categorical)**: What colour is something?

```r
library(tidyverse)
library(palmerpenguins)
head(penguins)
```

![upgit_20221127_1669588300.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669588300.png)

>[!note] Note
>- Visualisation in R with `ggplot2` package which is included in the `tidyverse` package.
>- Load the palmer penguins library
>- We can take a look at the data set by using the `head` function.

## Types of variables

1. *Continuous* : Numeric variables that can take any value on an interval.e.g.Bill length,Bill depth
2. *Discrete* : Numeric variables for which there is a minimum gap between possible values.e.g.year the observation was recorded
3. *Categorical* : Variables that can take on only a specific set of values representing distinct categories. 
	e.g. species, island, etc.

## Univariate plots

```r
univar_plot<-ggplot(data=penguins,aes(x=flipper_length_mm))+xlab("Flipper Length(mm)")
univar_plot+geom_histogram(binwidth=5)+ylab("Count")

```
![[../../../../Attachments/Pasted image 20221127224619.png]]

| Aesthetic                                                                            | Guide                                 | Glyph |
| ------------------------------------------------------------------------------------ | ------------------------------------- | ----- |
| A mapping between a variable and a visual cue. Flipper length → horizontal position. | An annotation which provides context. |   A glyph is a basic graphical element.    |

Each bar represents the number of penguins with flipper lengths within the window.

```r
univar_plot+geom_density(adjust=1)+ylab('Density')
```
![[../../../../Attachments/Pasted image 20221127224936.png]]
This is a **bimodal distribution**.
A density plot is a smoothed analogue of a histogram.

| Aesthetic | Glyph                                                                   |
| --------- | ----------------------------------------------------------------------- |
|  A mapping between a variable and a visual cue. Flipper length → horizontal position         | A glyph is a basic graphical element. The line within the density plot. |

>[!note] Note
>Histograms and density plots display the shape of the **data distribution**.

### Skewness

#### Negatively skewed
Negatively skewed data occurs when there is a large left tail consisting of a relatively small number of relatively low values, but most of the data is towards the upper end of the plot.
![upgit_20221127_1669589623.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669589623.png)

#### Positively skewed
Positively skewed data occurs when there is a large right tail consisting of a relatively small number of relatively high values, but most of the data is towards the lower end of the plot.
![upgit_20221127_1669589661.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669589661.png)



## Bivariate plots
* 其中theme_bw()是主题模板

```r
ggplot(data=rename(penguins,Species=species),aes(x=flipper_length_mm,color=Species))+
  geom_density()+
  theme_bw()+
  xlab("Flipper length(mm)")+
  ylab("Density")
```
![[../../../../Attachments/Pasted image 20221127225827.png]]
**Aesthetics**
Mappings between a variable and a visual cue.
<font color=#c10b26>Flipper length</font> → horizontal position.
<font color=#c10b26>Species</font> → colour

```r
ggplot(data=penguins,aes(x=flipper_length_mm,y=species))+
  geom_boxplot()+
  xlab('Flipper length(mm)')+
  ylab("Penguin species")
```
![[../../../../Attachments/Pasted image 20221127230109.png]]

```r
ggplot(data=rename(penguins,Species=species),aes(x=flipper_length_mm,y=Species,fill=Species))+
  geom_violin()+
  theme_bw()+
  xlab("Flipper length()")
```
![[../../../../Attachments/Pasted image 20221127230234.png]]
**Aesthetics**
Mappings between a variable and a visual cue.
<font color=#c10b26>Flipper length</font> → horizontal position.
<font color=#c10b26>Species</font> → vertical position.
<font color=#c10b26>Species</font> → colour

```r
mass_flipper_scatter<-ggplot(data=penguins,aes(y=body_mass_g,x=flipper_length_mm))+
  xlab("Flipper length(mm)")+
  ylab("Body mass(g)")
mass_flipper_scatter+geom_point(size=3)
```
![[../../../../Attachments/Pasted image 20221127230429.png]]

| Aesthetics                            | Glyph  |
| ------------------------------------- | ------ |
| Flipper length → horizontal position. | Points |
| Body mass → vertical position.        |        |


## Multivariate plots

```r
mass_flipper_scatter+
  geom_point(aes(color=bill_length_mm,size=3))+
  scale_color_gradient(low="blue",high="red")+
  guides(color=guide_legend("Bill length(mm)"))
```
![[../../../../Attachments/Pasted image 20221127230700.png]]
**Aesthetics**
<font color=#c10b26>Flipper length</font> → horizontal position.
<font color=#c10b26>Body mass</font> → vertical position.
<font color=#c10b26>Bill length</font> → colour

```r
mass_flipper_scatter+geom_point(aes(color=bill_length_mm,size=bill_depth_mm))+
  scale_color_gradient(low="blue",high="red")+
  guides(color=guide_legend("Bill length(mm)"),size=guide_legend("Bill depth(mm)"))
```
![[../../../../Attachments/Pasted image 20221127230804.png]]
**Aesthetics**
<font color=#c10b26>Flipper length</font> → horizontal position.
<font color=#c10b26>Body mass</font> → vertical position.
<font color=#c10b26>Bill length</font> → colour
<font color=#c10b26>Bill depth</font> → size

```r
mass_flipper_scatter+geom_point(aes(color=species,shape=species))
```
![[../../../../Attachments/Pasted image 20221127230939.png]]
**Aesthetics**
<font color=#c10b26>Flipper length</font> → horizontal position.
<font color=#c10b26>Body mass</font> → vertical position.
<font color=#c10b26>Species</font> → colour
<font color=#c10b26>Species</font> → shape

```r
mass_flipper_scatter+
  geom_text(aes(label=species,color=species))+
  guides(color=guide_legend("Species"))
```
![[../../../../Attachments/Pasted image 20221127231045.png]]
**Aesthetics**
<font color=#c10b26>Flipper length</font> → horizontal position.
<font color=#c10b26>Body mass</font> → vertical position.
<font color=#c10b26>Species</font> → colour
<font color=#c10b26>Species</font> → text


## Facets
* leverage the function **facet_wrap()** to create multiple panels
```r
mass_flipper_scatter+geom_point()+facet_wrap(~species)
```
![[../../../../Attachments/Pasted image 20221127231223.png]]
**Aesthetics**
<font color=#c10b26>Flipper length</font> → horizontal position.
<font color=#c10b26>Body mass</font> → vertical position

**Facets**
<font color=#c10b26>Species</font>

## Trend lines
Trend lines illustrate the relationship between two variables.
```r
trend_plot<-ggplot(data=filter(penguins,species=='Gentoo'),aes(y=body_mass_g,x=flipper_length_mm))+
  xlab("Flipper length(mm)")+
  ylab("Body mess(g)")+
  geom_point()
trend_plot+geom_smooth()
```
![[../../../../Attachments/Pasted image 20221127231439.png]]

```r
trend_plot+geom_smooth(method="lm")
```
![[../../../../Attachments/Pasted image 20221127231509.png]]

## Annotation
```r
min(filter(penguins,species=='Gentoo')$body_mass_g,na.rm=TRUE)
```

```
[1] 3950
```

```r
trend_plot+
  geom_smooth(method="lm")+
  geom_curve(x=220,xend=209,y=4250,yend=3975,arrow=arrow(length=unit(0.5,'cm')),curvature=0.1)+
  geom_text(x=225,y=4250,label="The lightest Gentoo \n penguin weighs 39.5 kg")
```
![[../../../../Attachments/Pasted image 20221127231728.png]]
[GGplot2 Gallery](https://exts.ggplot2.tidyverse.org/gallery/)
