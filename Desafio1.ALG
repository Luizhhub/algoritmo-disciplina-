Algoritmo "semnome"
const
 Valor_KM = 2.5
 
tipo
   estrutura_entrega = registro
      codigo : inteiro
      prioridade : inteiro
      estado : inteiro
      peso : real
      valor_prod : real
      entrega_custo : real
      distancia : real
      origem : inteiro
      destino : inteiro
      destinatario : caracter
fimregistro

Var
x, y, n, m, opcao,QA,QT,QE,QU,QP,QN,RC,RN,RS,RL,RO,codigo_co: inteiro
aux,peso_T,valor_T,custo_T,valor_M,peso_M,distancia_M:real
distancias: vetor [1..5, 1..5] de inteiro
percuso: vetor [1..5] de inteiro
fila_despase: vetor [1..30,1..6] de real
Codigos_entregas: vetor [1..30] de estrutura_entrega

procedimento inicialaziar_M
             //inicializa a matriz de distancias
 var
  i,j:inteiro
 
 inicio
  para i de 1 ate 5 faca
       para j de 1 ate 5 faca
            se(i = j)entao
               distancias[i,j]<- 0
            fimse
       fimpara
  fimpara
  distancias[2,1]<- 12
  distancias[1,2]<- 12
  distancias[3,1]<- 15
  distancias[1,3]<- 15
  distancias[4,1]<- 10
  distancias[1,4]<- 10
  distancias[5,1]<- 14
  distancias[1,5]<- 14
  distancias[3,2]<- 25
  distancias[2,3]<- 25
  distancias[4,2]<- 18
  distancias[2,4]<- 18
  distancias[5,2]<- 20
  distancias[2,5]<- 20
  distancias[4,3]<- 16
  distancias[3,4]<- 16
  distancias[5,3]<- 19
  distancias[3,5]<- 19
  distancias[5,4]<- 22
  distancias[4,5]<- 22
fimprocedimento

procedimento Visualizar_M
             //cria uma tabale da matriz de distancia
 var
  i,j:inteiro

 inicio
 escreval("      |CENTRO|NORTE|SUL |LESTE|OESTE|")
  para i de 1 ate 5 faca
       escreval("      ===============================")
       se(i = 1)entao
            escreva("CENTRO|")
       fimse
       se(i = 2)entao
            escreva("NORTE |")
       fimse
       se(i = 3)entao
            escreva("SUL   |")
       fimse
       se(i = 4)entao
            escreva("LESTE |")
       fimse
       se(i = 5)entao
            escreva("OESTE |")
       fimse
       para j de 1 ate 5 faca
            se(i = j)entao
               escreva("| ",distancias[i,j]," |")
            senao
               escreva("|",distancias[i,j]," |")
            fimse
       fimpara
       escreval("")
  fimpara
  escreval("      ===============================")
fimprocedimento

procedimento Cadastrar
             //cadastra uma intrega
 var
 auxL,a,b,c : inteiro
 inicio
se (n < 30) entao
              n<- n+1
              escreval("Escreva o Codigo: ")
              leia(auxL)
              para x de 1 ate n faca
                 enquanto (auxL = Codigos_entregas[x].codigo) faca
                    escreval("Codigos sao unicos: ")
                    leia(auxL)
                 fimenquanto
              fimpara
              Codigos_entregas[n].codigo<- auxL
              fila_despase[n,1]<- Codigos_entregas[n].codigo
              escreval("Escreva a origem")
              leia(auxL)
              enquanto ((auxL > 5) ou (auxL < 1)) faca
                    escreval("origem invalida: ")
                    leia(auxL)
              fimenquanto
              Codigos_entregas[n].origem<- auxL
              fila_despase[n,2]<- Codigos_entregas[n].origem
              escreval("Escreva o destino")
              leia(auxL)
              enquanto ((auxL > 5) ou (auxL < 1)) faca
                    escreval("destino invalido: ")
                    leia(auxL)
              fimenquanto
              Codigos_entregas[n].destino<- auxL
              se (Codigos_entregas[n].destino = 1) entao
                 RC <- RC+1
              fimse
              se (Codigos_entregas[n].destino = 2) entao
                 RN <- RN+1
              fimse
              se (Codigos_entregas[n].destino = 3) entao
                 RS <- RS+1
              fimse
              se (Codigos_entregas[n].destino = 4) entao
                 RL <- RL+1
              fimse
              se (Codigos_entregas[n].destino = 5) entao
                 RO <- RO+1
              fimse
              fila_despase[n,3]<- Codigos_entregas[n].destino
              escreval("Escreva o peso")
              leia(auxL)
              enquanto (auxL < 0) faca
                    escreval("peso invalido: ")
                    leia(auxL)
              fimenquanto
              Codigos_entregas[n].peso<- auxL
              fila_despase[n,4]<- Codigos_entregas[n].peso
              escreval("Escreva o valor do produto")
              leia(auxL)
              enquanto (auxL <= 0) faca
                    escreval("Valor da mercadoria invalido: ")
                    leia(auxL)
              fimenquanto
              Codigos_entregas[n].valor_prod<- auxL
              fila_despase[n,5]<- Codigos_entregas[n].valor_prod
              escreval("Escreva a prioridade do pedido")
              leia(auxL)
              enquanto ((auxL > 2) ou (auxL < 0)) faca
                    escreval("prioridade invalida: ")
                    leia(auxL)
              fimenquanto
              Codigos_entregas[n].prioridade<- auxL
              se (Codigos_entregas[n].prioridade = 0) entao
                 QN <- QN+1
              fimse
              se (Codigos_entregas[n].prioridade = 1) entao
                 QP <- QP+1
              fimse
              se (Codigos_entregas[n].prioridade = 2) entao
                 QU <- QU+1
              fimse
              fila_despase[n,6]<- Codigos_entregas[n].prioridade
              //fila_despase[n,x]<- Codigos_entregas[n,x]
              escreval("Escreva o destinatario")
              leia(Codigos_entregas[n].destinatario)
              a<- (Codigos_entregas[n].destino - Codigos_entregas[n].origem)
              Codigos_entregas[n].entrega_custo<- calcular_custo(a,Codigos_entregas[n].peso,Codigos_entregas[n].prioridade)
              escreval("")
              QA<- QA+1
           fimse
fimprocedimento

procedimento listar
             //listas todas intregas e espacos abertos
  Var
  Inicio
  para x de 1 ate 30 faca
     escreval("entrega ",x," :",Codigos_entregas[x].codigo)
     peso_T<- peso_T + Codigos_entregas[x].peso
     se (Codigos_entregas[x].peso > peso_M) entao
        peso_M<- Codigos_entregas[x].peso
     fimse
     peso_T<- valor_T + Codigos_entregas[x].valor_prod
     se (Codigos_entregas[x].valor_prod > valor_M) entao
        valor_M<- Codigos_entregas[x].valor_prod
     fimse
     custo_T<- custo_T + Codigos_entregas[x].entrega_custo
     se (Codigos_entregas[x].destino - Codigos_entregas[x].origem > distancia_M) entao
        distancia_M<- Codigos_entregas[x].destino - Codigos_entregas[x].origem
     fimse
  fimpara

fimprocedimento

procedimento ordenar
             //ordena a fila de despaçamento
  Var
  Inicio
           para y de 1 ate n-1 faca
                para x de 1 ate n-1 faca
                     se (fila_despase[x,6] > fila_despase[x+1,6]) entao
                         para m de 1 ate 6 faca
                              aux<- fila_despase[x+1]
                              //escreval("aux: ",aux)
                              //escreval("fila_despase[x+1,m]1: ",fila_despase[x+1,m])
                              fila_despase[x+1,m]<- fila_despase[x,m]
                              //escreval("fila_despase[x+1,m]2: ",fila_despase[x+1,m])
                              fila_despase[x,m]<- aux
                         fimpara
                     senao
                           se ((fila_despase[x,6] = fila_despase[x+1,6]) e (fila_despase[x,5] > fila_despase[x+1,5])) entao
                               para m de 1 ate 6 faca
                                    aux<- fila_despase[x+1,m]
                                    fila_despase[x+1,m]<- fila_despase[x,m]
                                    fila_despase[x,m]<- aux
                               fimpara
                           senao
                                 se ((fila_despase[x,5] = fila_despase[x+1,5]) e (fila_despase[x,4] > fila_despase[x+1,4])) entao
                                     para m de 1 ate 6 faca
                                          aux<- fila_despase[x+1,m]
                                          fila_despase[x+1,m]<- fila_despase[x,m]
                                          fila_despase[x,m]<- aux
                                     fimpara
                                 senao
                                       se ((fila_despase[x,4] = fila_despase[x+1,4]) e (fila_despase[x,1] > fila_despase[x+1,1])) entao
                                          para m de 1 ate 6 faca
                                               aux<- fila_despase[x+1,m]
                                               fila_despase[x+1,m]<- fila_despase[x,m]
                                               fila_despase[x,m]<- aux
                                          fimpara
                                       fimse
                                 fimse
                           fimse
                     fimse
                fimpara
           fimpara
fimprocedimento

procedimento iniciar_trasporte
             //muda de aguardando para transporte
  Var
  n1,n2:real
  Inicio
   escreval("Digite o codigo da entrega para ser iniciada: ")
   leia(y)
   n1<- codigos_entregas[x].estado+1
   para x de 1 ate n faca
        se ((y = Codigos_entregas[x].codigo) e (n1 = 1)) entao
           Codigos_entregas[x].estado<- 1
           QT<- QT+1
           QA<- QA-1
           n2<-1

        fimse
   fimpara
   se (n2 <> 1) entao
     escreval("Invalido1")
   fimse

fimprocedimento

procedimento finalizar_entrega
             //muda de transporte para entrege
  Var
  n1,n2:real
  Inicio
   escreval("Digite o codigo da entrega para ser finalizada: ")
   leia(y)
   n1<- codigos_entregas[x].estado+1
   para x de 1 ate n faca
        se ((y = Codigos_entregas[x].codigo) e (n1 = 2)) entao
            Codigos_entregas[x].estado<- 2
            QE<- QE+1
            QT<- QT-1
            n2<-1)
        fimse
   fimpara
   se (n2 <> 1) entao
     escreval("Invalido")
   fimse
fimprocedimento

procedimento estatisticas
             //exibe estastisticas
  Var
  Inicio
   escreval("quantidade total de entregas: ",n)
   escreval("quantidade aguardando: ",QA)
   escreval("quantidade em transporte:",QT)
   escreval("quantidade entregue:",QE)
   escreval("quantidade de entregas urgentes:",QU)
   escreval("quantidade de entregas prioritárias:",QP)
   escreval("quantidade de entregas normais:",QN)
   escreval("peso total transportado:",peso_T)
   escreval("média de peso:",peso_T/n)
   escreval("valor total das mercadorias:",valor_T)
   escreval("valor médio das mercadorias:",valor_T/n)
   escreval("custo total estimado:",custo_T)
   escreval("custo médio das entregas:",custo_t/n)
   escreval("entrega de maior valor:",valor_M)
   escreval("entrega de maior peso:",peso_M)
   escreval("entrega de maior distância:",distancia_M)
   se ((RC > RS) e (RC > RN) e (RC > RL) e (RC > RO)) entao
      escreval("região que recebeu maior quantidade de entregas:Centro")
   fimse
   se ((RS > RC) e (RS > RN) e (RS > RL) e (RS > RO)) entao
      escreval("região que recebeu maior quantidade de entregas:Sul")
   fimse
   se ((RN > RS) e (RN > RC) e (RN > RL) e (RN > RO)) entao
      escreval("região que recebeu maior quantidade de entregas:Norte")
   fimse
   se ((RL > RS) e (RL > RN) e (RL > RC) e (RL > RO)) entao
      escreval("região que recebeu maior quantidade de entregas:Leste")
   fimse
   se ((RO > RS) e (RO > RN) e (RO > RL) e (RO > RC)) entao
      escreval("região que recebeu maior quantidade de entregas:Oste")
   fimse

fimprocedimento

funcao calcular_custo(distancia: real; peso: real; prio: inteiro): real
       //calcula o custa da entrega
 var
 custo_final,Custo_base: real
 inicio
    Custo_base <- distancia * Valor_KM
    se (peso <= 5) entao
       custo_final <- Custo_base + (0 *(Custo_base/100))
    fimse
    se ((peso > 5) e (peso <= 20)) entao
       custo_final <- Custo_base + (10 *(Custo_base/100))
    fimse
    se ((peso > 20) e (peso <= 50)) entao
       custo_final <- Custo_base + (20 *(Custo_base/100))
    fimse
    se (peso > 50) entao
       custo_final <- Custo_base + (35 *(Custo_base/100))
    fimse
    se (prio = 0) entao
       custo_final <- Custo_base + (0 *(Custo_base/100))
    fimse
    se (prio = 1) entao
       custo_final <- Custo_base + (15 *(Custo_base/100))
    fimse
    se (prio = 2) entao
       custo_final <- Custo_base + (30 *(Custo_base/100))
    fimse
 
    retorne custo_final
fimfuncao

funcao localizar(codigo_co: inteiro): inteiro
       //imprime detalhas the uma entrega especifica
 var
 inicio
   m<- 0
   para x de 1 ate 30 faca
        se(codigo_co = Codigos_entregas[x].codigo) entao
           //escreval("Codigo: ",Codigos_entregas[x].codigo)
           escreval("origem: ",Codigos_entregas[x].origem)
           escreval("destino: ",Codigos_entregas[x].destino)
           escreval("peso: ",Codigos_entregas[x].peso)
           escreval("valor: ",Codigos_entregas[x].valor_prod)
           escreval("prioridade: ",Codigos_entregas[x].prioridade)
           escreval("estado:",Codigos_entregas[x].estado)
           escreval("entrega custo:",Codigos_entregas[x].entrega_custo)
           escreval("distancia:",Codigos_entregas[x].distancia)
           escreval("destinatario:",Codigos_entregas[x].destinatario)
           retorne Codigos_entregas[x].codigo

           m<- 1
        fimse
   fimpara
   se (m <> 1) entao
      escreval("Entrega não encontrada")
   fimse

fimfuncao

funcao Calc_Ca(xx: inteiro): inteiro
       //calcula a distancia do caminho
 var
    distanciaTotal: inteiro
 inicio
    se(xx < 4)entao
      distanciaTotal<- distanciaTotal + distancias[percuso[xx+1],percuso[xx+2]] + Calc_Ca(xx+1)
    senao
      retorne distancias[percuso[xx],percuso[xx+1]]
    fimse
    escreval("")
    retorne distanciaTotal

fimfuncao


Inicio
inicialaziar_M()
enquanto (opcao <> 10) faca
         //tela do usuario
   escreval("1. Cadastrar entrega")
   escreval("2. Listar entregas")
   escreval("3. Consultar entrega")
   escreval("4. Exibir fila de despacho")
   escreval("5. Iniciar transporte")
   escreval("6. Finalizar entrega")
   escreval("7. Exibir matriz de distancias")
   escreval("8. Exibir estatisticas")
   escreval("9. Calcular percurso recursivamente")
   escreval("10. Encerrar sistema")
   escreval("")
   leia(opcao)
   //chama com base na que é preciso denominado pelo numero digitado e sua correspondente função
   escolha(opcao)
         caso 1
           cadastrar()
           escreval("")
         caso 2
           listar()
           escreval("")
         caso 3
           escreval("Digite o codigo da entraga para ser consultada")
           leia(codigo_co)
           escreval("detalhes da entrega: ", localizar(codigo_co))
           escreval("")
         caso 4
           ordenar()
           para x de 1 ate n faca
                escreval("entrega numero ",x,":",fila_despase[x,1])
           fimpara
           escreval("")
         caso 5
           iniciar_trasporte()
         caso 6
           finalizar_entrega()
         caso 7
           Visualizar_M()
         caso 8
           estatisticas()
         caso 9
            enquanto x < 5 faca
                 x<- x+1
                 escreval("Escreva o numero representante da regiao ou 0 para terminar")
                 leia(percuso[x])
                 se(percuso[x] = 0)entao
                     para y de x ate 5 faca
                          percuso[y]<- percuso[x-1]
                     fimpara
                     x<- 5
                 fimse
            fimenquanto
           escreval("calculo total: ",Calc_Ca(1))
           escreval("")
         caso 10
                  //termina o looping e o programa
           escreval("Terminado programa")
         outrocaso
                  // mostra que input é invalido
                  escreval("invalido")
   fimescolha
fimenquanto

Fimalgoritmo