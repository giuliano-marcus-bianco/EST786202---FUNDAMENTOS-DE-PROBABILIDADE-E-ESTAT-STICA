# Instala e carrega o pacote para ler arquivos Excel
install.packages("readxl")
library(readxl)

# Define o nome do arquivo Excel a ser lido (deve estar na mesma pasta do script)
arquivo <- "student_habits_performance.xlsx"

# Lê os dados do arquivo Excel para um data frame chamado 'dados'
dados <- read_excel(arquivo)

# Lista dos parâmetros a serem analisados
parametros <- c("study_hours_per_day", "social_media_hours", "attendance_percentage", "sleep_hours", "exercise_frequency")

# Calcula a correlação de cada parâmetro com a nota do exame (exam_score)
correlacoes <- sapply(parametros, function(x) cor(dados[[x]], dados$exam_score, use = "complete.obs"))

# Identifica qual parâmetro tem maior impacto (maior valor absoluto de correlação)
parametro_maior_impacto <- names(which.max(abs(correlacoes)))
cat("Maior impacto:", parametro_maior_impacto, "\n")
print(correlacoes)

png("grafico.png", width = 800, height = 600) # Abre o dispositivo gráfico para salvar como PNG, maior resolução

# Faz o gráfico de dispersão entre o parâmetro de maior impacto e exam_score, com design melhorado
plot(
  dados[[parametro_maior_impacto]], dados$exam_score,
  xlab = parametro_maior_impacto,
  ylab = "exam_score",
  main = paste("Relação entre", parametro_maior_impacto, "e exam_score"),
  pch = 19,                # pontos sólidos
  col = "#1f77b4",         # cor azul mais agradável
  cex = 1.5,               # aumenta o tamanho dos pontos
  cex.lab = 1.3,           # aumenta o tamanho dos rótulos dos eixos
  cex.main = 1.4           # aumenta o tamanho do título
)
grid(col = "gray80", lty = "dotted") # adiciona grid leve

# Adiciona uma linha de tendência ao gráfico
abline(lm(dados$exam_score ~ dados[[parametro_maior_impacto]]), col = "#ff7f0e", lwd = 2)

# Adiciona o valor da correlação no canto superior esquerdo
cor_val <- correlacoes[parametro_maior_impacto]
legend("topleft",
       legend = sprintf("Correlação: %.2f", cor_val),
       bty = "n", text.col = "black", cex = 1.2)

dev.off() # Fecha e salva o arquivo

# --- RESPOSTA QUESTÃO 2 ---

# A equação foi encontrada ajustando um modelo de regressão linear múltipla (lm) com exam_score como variável dependente
# e study_hours_per_day e social_media_hours como variáveis independentes, usando os dados do arquivo Excel.
# O R calcula automaticamente os coeficientes que melhor explicam a relação entre as variáveis.

# a) Ajusta o modelo linear múltiplo
modelo <- lm(exam_score ~ study_hours_per_day + social_media_hours, data = dados)
coeficientes <- coef(modelo)
cat("Equação: exam_score =", 
    sprintf("%.3f", coeficientes[1]), "+", 
    sprintf("%.3f", coeficientes[2]), "* study_hours_per_day +", 
    sprintf("%.3f", coeficientes[3]), "* social_media_hours\n")

# b) Calcula a nota para 3h de estudo e 6h em redes sociais
nota_predita <- coeficientes[1] + coeficientes[2]*3 + coeficientes[3]*6
cat("Nota prevista para 3h de estudo e 6h em redes sociais:", round(nota_predita, 2), "\n")