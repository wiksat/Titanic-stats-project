#import
library(ggplot2)

#wgrywamy plik
titanic <-read.csv("titanic.csv", header=TRUE)

#Ilość pasażeróW z podziałem na klasy (wkres 1)
ggplot(titanic, aes(x=Pclass, fill=Survived)) + theme_bw() +geom_bar(color = "#8a3333", fill = "#aed68f") +
  labs( y="Number of Passengers", x="Passenger Class", title="Titanic Survival by Passenger Class")

#konwersja zmiennych
titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)
class(titanic$Survived)
class(titanic$Pclass)

#Ilość pasażerów zdanej klasy z podziałem na płcie oraz czy przeżyli (wykres 2)
ggplot(titanic, aes(x=Sex, fill=Survived)) +
  theme_bw() +
  geom_bar() +
  labs( y="Number of Passengers", title="Titanic Survival Rate by Gender by Passenger Class")+ 
  facet_wrap(~Pclass)

#Histogram który dodaje do poprzedniego wykresu podział na wiek (wykres 3)
ggplot(titanic, aes(x=Age, fill=Survived))+
  geom_histogram(bins=20, colour="#1380A1") +
  labs(title="Survival Rate by Gender", y="Number of passengers", subtitle = "Distribution by age, gender and ticket class")+
  theme_bw() +
  facet_grid(Sex~Pclass, scales="free")

#Wykres rozkłądu wieku wraz z boxplot'em (wykres 4)
ggplot(data = titanic, aes(x=Pclass, y=Age)) +
      geom_boxplot(alpha=0.5) +
      geom_jitter(aes(colour = Survived)) +
      labs(title="Age Distribution by Passenger Class on Titanic") +
      xlab("Passenger Class") +
      ylab("Age(years)") +
      facet_wrap(~Sex)

#Wykres rozkłądu wieku wraz z violinem'em (wykres 5)
ggplot(data = titanic, aes(x=Pclass, y=Age)) +
  geom_violin(alpha=0.5) +
  geom_jitter(aes(colour = Survived)) +
  labs(title="Age Distribution by Passenger Class on Titanic") +
  xlab("Passenger Class") +
  ylab("Age(years)") +
  facet_wrap(~Sex)










