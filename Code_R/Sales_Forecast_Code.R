hellor <- read.csv("C:/Users/Nirbhay Pherwani/Desktop/ARS.csv")
attach(hellor)
data<-ts(Billing.Actual,start = c(1,1),frequency = 1)
par(las=3)
plot(data, xlab="", ylab = "Bolero Sales in Chennai", xaxt="n",col="red")
axis(1, at=1:12, labels=paste(month.abb,2013,""), cex.axis=0.6)
axis(1, at=13:24, labels=paste(month.abb,2014,""), cex.axis=0.6)
plot(diff(data),ylab="Differenced Bolero Sales in Chennai", xaxt="n",xlab="",col="red")
axis(1, at=1:12, labels=paste(month.abb,2013,""), cex.axis=0.6)
axis(1, at=13:24, labels=paste(month.abb,2014,""), cex.axis=0.6)
plot(log10(data),ylab="Log10(Bolero Sales in Chennai)", xaxt="n",xlab="",col="red")
axis(1, at=1:12, labels=paste(month.abb,2013,""), cex.axis=0.6)
axis(1, at=13:24, labels=paste(month.abb,2014,""), cex.axis=0.6)
plot(diff(log10(data)),xlab="",ylab="Differenced Log (Bolero Sales in Chennai)", xaxt="n",col="red")
axis(1, at=1:12, labels=paste(month.abb,2013,""), cex.axis=0.6)
axis(1, at=13:24, labels=paste(month.abb,2014,""), cex.axis=0.6)
par(mfrow = c(1,2))
acf(ts(((data))),main="ACF Bolero Sales in Chennai",col="green")
pacf(ts(((data))),main="PACF Bolero Sales in Chennai", col="green")
par(mfrow = c(1,1))
require(forecast)
AR <- auto.arima((log10(data)), approximation=FALSE,trace=FALSE)
summary(AR)
par(bg = "white")
pred <- predict(AR, n.ahead = 5)
pred
pred$pred
plot(data,col="red",xlim=c(1,32),ylim=c(1,600),xaxt="n" ,xlab = "",ylab = "Bolero Sales in Chennai",main="Bolero Sales Forecast for 2015 in Chennai")
lines(10^(pred$pred),col="blue" ,xaxt="n")
#lines(10^(pred$pred+2*pred$se),col="green")
#lines(10^(pred$pred-2*pred$se),col="green")
par(las=3)
axis(1, at=1:12, labels=paste(month.abb,2013,""), cex.axis=0.6)
axis(1, at=13:24, labels=paste(month.abb,2014,""), cex.axis=0.6)
axis(1, at=25:36, labels=paste(month.abb,2015,""), cex.axis=0.6)
#Only the Predicted Plot
plot(10^(pred$pred),col="blue" ,xaxt="n", xlab="",ylab="Bolero Sales in Chennai",main="Bolero Sales Forecast for 2015 in Chennai")
axis(1, at=25:36, labels=paste(month.abb,2015,""), cex.axis=0.6)

