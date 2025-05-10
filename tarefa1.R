# Definindo os intervalos de classe (ponto médio)
intervalos <- c(25, 35, 45, 55, 65)  # Pontos médios das classes
frequencias <- c(4, 6, 8, 6, 4)     # Frequências (Fi)

# a) Histograma
# Criar breaks para o histograma
breaks <- seq(20, 70, by=10)
# Expandir os dados baseado nas frequências
dados_expandidos <- rep(intervalos, frequencias)

# Criando o histograma
hist(dados_expandidos, 
     breaks=breaks,
     main="Histograma da Distribuição",
     xlab="Valores",
     ylab="Frequência",
     col="lightblue",
     border="black")

# b) Média
media <- sum(intervalos * frequencias) / sum(frequencias)
print(paste("Média:", round(media, 2)))

# c) Mediana
# Primeiro, vamos criar os dados expandidos ordenados
dados_ordenados <- sort(dados_expandidos)
mediana <- median(dados_ordenados)
print(paste("Mediana:", round(mediana, 2)))

# e) Desvio Padrão
# Calculando a variância primeiro
variancia <- sum(frequencias * (intervalos - media)^2) / sum(frequencias)
desvio_padrao <- sqrt(variancia)
print(paste("Desvio Padrão:", round(desvio_padrao, 2)))