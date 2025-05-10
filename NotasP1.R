#Resultado Prova 1 Descritiva

n <-c(10,5,7,8,10,6,9,5,10,10,8,5,8,7,5,5,7,7,0,5,8,0,9,7,0)
l <-length(n)
l
hist(n, breaks = seq(0,10, length.out = 11), main = "Notas P1", xlab = "Notas", ylab="Frequências", col = "lightblue") 


