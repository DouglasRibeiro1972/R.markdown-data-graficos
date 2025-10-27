
# --- render_relatorios.R ---
library(webshot2)
# 1. Defina o caminho completo da pasta (usando barras para frente)
CAMINHO_FINAL <- "C:/Users/douglas.ribeiro/Desktop/ESTUDOS DOUGLAS/teste_graf_rmkdwn"

# 2. Defina o nome do seu arquivo R Markdown (o arquivo que tem o seu conteúdo)
# SUBSTITUA 'seu_relatorio.Rmd' pelo nome real do seu arquivo
ARQUIVO_RMD <- "C:/Users/douglas.ribeiro/Desktop/ESTUDOS DOUGLAS/teste_graf_rmkdwn/analise_rmrkdwn.Rmd" 

# 3. Garanta que a pasta exista
if(!dir.exists(CAMINHO_FINAL)) {
  dir.create(CAMINHO_FINAL, recursive = TRUE)
}

# 4. Renderiza para HTML (formato intermediário)
rmarkdown::render(
  input = ARQUIVO_RMD,
  output_format = "html_document",
  output_file = "Relatorio_Final_HTML.html",
  output_dir = CAMINHO_FINAL
)

# 5. Converte o HTML gerado para PNG
ARQUIVO_HTML <- file.path(CAMINHO_FINAL, "Relatorio_Final_HTML.html")
ARQUIVO_PNG <- file.path(CAMINHO_FINAL, "Grafico_Final.png")

webshot(
  url = ARQUIVO_HTML,
  file = ARQUIVO_PNG,
  # vwidth = 800,
  # vheight = ,
  delay = 5,
  zoom = 2
)
