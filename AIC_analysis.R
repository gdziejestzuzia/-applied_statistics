library(MASS)
dane <- na.omit(Cars93)
Cars93$Passengers <- as.factor(Cars93$Passengers)
Cars93$Cylinders <- factor(ifelse(Cars93$Cylinders %in% c("3", "4"), "3-4", ifelse(Cars93$Cylinders %in% c("5", "6"), "5-6", as.character(Cars93$Cylinders))))
model <- lm(Price ~. -Min.Price-Max.Price-Model - Make - Manufacturer, data = Cars93)
model1 <- lm(Price ~. -Min.Price-Max.Price-Model - Make - Manufacturer, data = dane)
plot(model)
summary(model)
step(model)
mod <- step(model, list(lower = Price~1, upper = model), direction = "both")

plot(mod)
shapiro.test(rstandard(mod))

odstajacy <- dane[52,]

dane_rm <- dane[-52,]

model2 <- lm(Price ~. -Min.Price-Max.Price-Model - Make - Manufacturer, data = dane_rm)
plot(model2)

which(cooks.distance(model)> 0.5)
plot(model2)
summary(model2)
step(model2)


anova(model, model2) 

  
summary(model2)

