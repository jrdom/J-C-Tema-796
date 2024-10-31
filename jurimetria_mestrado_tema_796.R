library(tjsp)
tjsp_baixar_cjsg(
  livre = "ITBI E INTEGRALIZAÇÃO DE BENS IMÓVEIS",
  ementa = "",
  processo = "",
  aspas = FALSE,
  classe = "198,1728",
  assunto = "5954",
  orgao_julgador = "",
  inicio = "",
  fim = "",
  inicio_pb = "",
  fim_pb = "",
  sg = "T",
  cr = "",
  tipo = "A",
  n = NULL,
  diretorio = "."
)


library(tjsp)
tjsp_baixar_cjsg(
  livre = "ITBI E INTEGRALIZAÇÃO DE BENS IMÓVEIS",
  ementa = "",
  processo = "",
  aspas = FALSE,
  classe = "198,1728",
  assunto = "5954",
  orgao_julgador = "",
  inicio = "",
  fim = "",
  inicio_pb = "",
  fim_pb = "",
  sg = "T",
  cr = "",
  tipo = "A",
  n = 1e6,
  diretorio = "."
)

tjsp_autenticar(login = "70194897109", password = "Jr19232527")
tabela <- tjsp_ler_cjsg(diretorio = ".")
tjsp_baixar_cposg(tabela$processo)
dados <- tjsp_ler_dados_cposg(diretorio = ".")
partes <- tjsp_ler_partes(diretorio = ".")
andamento <- tjsp_ler_movimentacao(diretorio = ".")
entrada <- tjsp_ler_entrada(diretorio = ".")
decisao <- tjsp_ler_dispositivo(diretorio = ".")
integral <- tjsp_ler_cjsg(arquivos = NULL, diretorio = ".")
acordao2 <- tjsp_baixar_acordaos_cposg(processos = NULL, diretorio = ".")

processos <- andamento$processo
tjsp_baixar_acordaos_cposg(processos = processos, diretorio = ".")

acordao_tudo <- tjsp_ler_acordaos_cjsg(
  arquivos = NULL,
  diretorio = ".",
  remover_assinatura = TRUE,
  combinar = TRUE
)


decisao <- tjsp_ler_dispositivo(diretorio = ".")
integral <- tjsp_ler_cjsg(arquivos = NULL, diretorio = ".")

library(openxlsx)

# Crie uma lista com os dados que você quer gravar em várias planilhas
dados_para_escrever <- list(
  "andamento" = andamento,
  "dados" = dados,
  "decisao" = decisao,
  "integral" = integral,
  "partes" = partes,
  "tabela" = tabela
)

# Escreva o arquivo Excel com múltiplas planilhas
write.xlsx(dados_para_escrever, file = "tudo.xlsx", asTable = FALSE)



library(openxlsx)
write.xlsx(andamento, dados, decisao, integral, partes, tabela, "decisao.xlsx")
library(xlsx)
write.xlsx(dados, "decisao.xlsx", row.names = FALSE)
