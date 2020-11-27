####### Teste de Hipóteses ##### 

### Ingredientes

#1.3 Teste de hipótese
  #1.3.1 Fundamentação teórica
  #1.3.1.1. Pressupostos para testes paramétricos
  
  #Homocedasticidade
  #A cada nível das variáveis previsoras, a variÃ¢ncia do termo residual 
  #deve ser constante. Isso significa que os resíduos a cada nível dos 
  #previsores devem ter a mesma variÃ¢ncia (homocedasticidade): quando 
  #as variÃ¢ncias sÃ£o desiguais diz-se que existe heterocedasticidade. 

  #Normalidade
  #É verificada se um conjunto de dados para uma dada variável aleatória 
  #é bem representada por uma distribuição normal (gausiana) ou não.

  #1.3.1.2. Testes não-paramétricos

  #Quando um desses pressupostos não é atendido, o teste de hipótese deve ser
  #não-paramétrico. A escolha de qual teste seria utilizado a partir dessa situação
  #depende principalmente do tipo de variável do estudo e se as amostras são pareadas
  #ou não.

#1.3.2 Comandos utilizados e suas sintaxes

  #Teste de Levene - Análise a homocedasticidade 
    #Pacote necessário
    install.packages("car")
    library(car)

    #Comando: Teste de Levene

      #Sintaxe: LeveneTest(dados$vardependente~dados$varindependente) / levene.test(y, group, location=c("median", "mean", "trim.mean"), trim.alpha=0.25, bootstrap = FALSE, num.bootstrap=1000, kruskal.test=FALSE, correction.method=c("none","correction.factor","zero.removal","zero.correction"))
      
      #Retorno: 
        #Df: Degrees of Freedom
        #F value: Quanto mais distante de 1, maior a diferenÃ§a detectada entre as 
        #variâncias. O valor de p informa quando essa diferença é significativa ou não.
        #Pr(>F): Valor de p para o teste de Levene em que a Ho é que as variâncias 
        #são iguais.
    
  #Shapiro-wilk, Kolmogorov-Smirnov e aspecto visual da distribuição - Teste de normalidade
    
    #Comando: Shapiro-wilk
    
      #Sintaxe: Shapiro.test(dados$vardependente) / shapiro.test(x)
      #Retorno:
      #W: Quanto mais próximo de 1, maior é a semelhança da curva estudada com a 
      #distribuição normal. O valor de p informa quando essa semelhança é significativa ou não.
      #P-value: Valor de p para o teste SW em que a Ho é que não há 
      #diferença entre a distribuição estudada e uma distribuição normal.
    
    #Comando: Kolmogorov-Smirnov
    
    #Pacote necessário
    install.packages("dgof")
    library(dgof)
    
    #Kolmogorov-Smirnov - Comando
    
    #Sintaxe: 
    #Ks.test(dados$vardependente,"pnorm", mean(dados$vardependente), sd(dados$vardependente)) / KSTest(object, ...)
    #pnorm identifica que o KS vai comparar a distribuição da variável dependente com a distribuição normal.
    
    #Retorno:
    #D: Representa a distância vertical máxima entre a curva estudada e a curva de referência.
    #Quando mais próximo de zero, maior a semelhança entre as duas distribuições.
    #P-value: Valor de p para o teste KS em que a Ho é que não há
    #diferença entre a distribuição estudada e uma distribuição normal.

  #Testes de hipóteses utilizados 
    
    #Comando - Teste T - NÃ£o pareado
  
    #Sintaxe: 
    #t.test(dados$varindependente~BD$vardependente) / t.test(data, formula, ...)
    
    #Retorno:
    #t: A diferenÃ§a calculada entre as mÃ©dias em unidades de desvio padrão;
    #Df: Degrees of freedom;
    #P-value: Valor de p para o teste KS em que a Ho é que não há diferença
    #entre as médias dos dois grupos.
    
    #Comando - One-way Anova
    
      #Opção I - Função lm()  
      #summary(lm(y ~ x))
    
      #A função lm() é utilizada para construir modelos lineares de regressão.
      #Sintaxe: lm(formula, data, weights, subset, na.action)
      #A função summary() fornece os principais parâmetros do objeto.
      #Retorno: Em termos de ANOVA, a parte de interesse do retorno o F-statistic, que dá
      #informação do F-value, dos DFs e p-value para a Ho de que todos os grupos têm médias
      #iguais entre si.
    
      #Opção II - Função anova()
      #anova(lm(y~x))
    
      a <- aov(y~x)
      summary(a)
    
      #A função anova() é utilizada para construir uma tabela ANOVA do objeto fornecido.
      #Sintaxe: Anova(mod, ...) em que mod pode ser lm para a "linear model", aov para "análise 
      #de variância" e outras funções.
      #Retorno: Informa Df, Sum sq, Mean Sq, F-value e p-value para a Ho de que todos os grupos 
      #têm médias iguais entre si.
    
      #Teste post-hoc (teste de Tukey)
      TukeyHSD(aov(y~x))
    
      #A função TukeyHSD() realiza o teste de Tukey no mod especificado (no caso, aov).
      #Sintaxe: TukeyHSD(x, which, ordered = FALSE, conf.level = 0.95, â¦)
      #Retorno: O elemento de maior interesse vai ser o p-value para identificar os grupos
      #nos quais as diferenÃ§as sÃ£o analisadas.

    #Comando - Teste de Wilcoxon-Mann-Whitney
       
       wilcox.test(y~x)
       
       #Sintaxe: wilcox.test(x, â¦)
       #Retorno: Valor de p para o teste WMW em que a Ho Ã© que nÃ£o hÃ¡ diferenÃ§a 
       #entre os dois grupos.
