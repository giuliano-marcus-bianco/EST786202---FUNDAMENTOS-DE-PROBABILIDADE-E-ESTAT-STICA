# Carregar bibliotecas necessárias
library(readxl)  # Para ler arquivo Excel
library(modeest) # Para calcular a moda

# Definir o caminho completo do arquivo Excel
pasta_script <- "c:/Users/gm_bi/Documents/GitHub/ifsc/2025.1/est"
caminho_arquivo <- file.path(pasta_script, "clima.xlsx")

# Ler o arquivo Excel
dados <- read_excel(caminho_arquivo)

# Verificar estrutura dos dados
print("Nomes das colunas:")
print(names(dados))
print("\nPrimeiras linhas dos dados:")
print(head(dados))

# 1) Calcular as médias
media_temp <- mean(dados$Temperatura)
media_pressao <- mean(dados$Pressão)
media_umidade <- mean(dados$Umidade)

cat("\n=== MÉDIAS ===\n")
cat("Temperatura:", round(media_temp, 2), "\n")
cat("Pressão:", round(media_pressao, 2), "\n")
cat("Umidade:", round(media_umidade, 2), "\n")

# 2) Calcular as medianas
mediana_temp <- median(dados$Temperatura)
mediana_pressao <- median(dados$Pressão)
mediana_umidade <- median(dados$Umidade)

cat("\n=== MEDIANAS ===\n")
cat("Temperatura:", round(mediana_temp, 2), "\n")
cat("Pressao:", round(mediana_pressao, 2), "\n")
cat("Umidade:", round(mediana_umidade, 2), "\n")

# 3) Calcular as modas
moda_temp <- mlv(dados$Temperatura, method="mfv")
moda_pressao <- mlv(dados$Pressão, method="mfv")
moda_umidade <- mlv(dados$Umidade, method="mfv")

cat("\n=== MODAS ===\n")
cat("Temperatura:", round(moda_temp, 2), "\n")
cat("Pressão:", round(moda_pressao, 2), "\n")
cat("Umidade:", round(moda_umidade, 2), "\n")

# 4) Calcular os desvios padrão
dp_temp <- sd(dados$Temperatura)
dp_pressao <- sd(dados$Pressão)
dp_umidade <- sd(dados$Umidade)

cat("\n=== DESVIOS PADRÃO ===\n")
cat("Temperatura:", round(dp_temp, 2), "\n")
cat("Pressão:", round(dp_pressao, 2), "\n")
cat("Umidade:", round(dp_umidade, 2), "\n")

# 5) Criar histogramas
# Configurar o layout para 3 gráficos
par(mfrow=c(2,2))

# Histograma da Temperatura
hist(dados$Temperatura, 
     main="Histograma da Temperatura",
     xlab="Temperatura",
     ylab="Frequência",
     col="lightblue",
     border="black")

# Histograma da Pressão
hist(dados$Pressão,
     breaks = 2,  # Define apenas 2 barras
     main="Histograma da Pressão",
     xlab="Pressão",
     ylab="Frequência",
     col="lightgreen",
     border="black")

# Histograma da Umidade
hist(dados$Umidade,
     main="Histograma da Umidade",
     xlab="Umidade",
     ylab="Frequência",
     col="lightpink",
     border="black")

# Restaurar o layout padrão
par(mfrow=c(1,1))