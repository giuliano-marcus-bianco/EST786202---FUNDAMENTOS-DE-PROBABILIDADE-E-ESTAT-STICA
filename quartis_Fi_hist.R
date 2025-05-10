# Quartis
i <- c(20, 24, 17, 18, 18, 22, 23, 24, 28, 28, 25, 25, 25, 23, 23, 18, 19, 19, 17, 20)
i
is <- sort(i)
is
range(is)
diff((range(is)))

quartis <- quantile(is, type=4)
quartis
summary(is)         # resumo da variavel


# Tabela de Fi

h <- c(6, 6, 7, 7, 8, 10,10, 11, 11, 11, 11, 11, 12, 12, 13, 14, 14, 14, 15, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, 18, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 22, 23, 23, 23, 23, 23, 23, 24, 24, 24, 25, 25, 25, 25, 26, 26, 27, 27, 27, 27, 28, 28, 29, 29, 30, 31, 32, 32, 33)

table_h <- table(cut(h, breaks = seq(6, 34, 4), right = FALSE)) # min, max, tamanho da classe, aberta à direita)
table_h

#Histograma definindo classes e intervalos

hist(h, breaks = seq(6,34, length.out = 8), right = FALSE, main = "Exemplo de Histograma", xlab = "Classes", ylab="Frequências", col = "lightblue") 

# length.out = classes +1, intervalo fechado à direita



