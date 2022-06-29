//
//  ServicoDeSpoiler.swift
//  ProjetoIntegrador
//
//  Created by Gui  on 23/06/22.
//

import Foundation

class ServicoDeSpoiler {
    
    var listaDeFilmesSpoiler: [Spoiler] = [
    
        Spoiler(title: "Ant-Man and The Wasp: Quantumania", spoiler: "", elenco: "Paul Rudd, Evangeline Lilly, Michael Douglas, Michelle Pfeiffer, Kathryn Newton, Jonathan Majors", descricaoCenaPosCreditos: " Scott está  prestes a retornar ao Reino Quântico para obter as partículas necessárias para a cura definitiva da Fantasma. Ele vai até o local e consegue as partículas necessárias. Mas no momento em que aguardava para retornar, perdeu a comunicação com Hope, Hank e Janet. No início, pensou se tratar de uma brincadeira, mas logo notou que se tratava de algo sério e se desesperou. O que ele não sabe é que Hope, Hank e Janet também se tornaram novas vítimas do estalar de dedos de Thanos no final de Vingadores: Guerra Infinita. Scott está preso no Reino Quântico. "),
        Spoiler(title: "Guardians of the Galaxy Vol. 3", spoiler: "Aguarde até o lançamento em 05/05/2023", elenco: "Chris Pratt, Zoë Saldaña, Dave Bautista, Vin Diesel, Bradley Cooper, Karen Gillan, Pom Klementieff, Sean Gunn, Sylvester Stallone, Will Poulter", descricaoCenaPosCreditos: "Aguarde até o lançamento em 05/05/2023"),
        Spoiler(title: "Fantastic Four", spoiler: "Aguarde até o lançamento em 2023", elenco: "Ioan Gruffudd, Jessica Alba, Michael Chiklis, Chris Evans, Julian McMahon, Laurie Holden", descricaoCenaPosCreditos: "Aguarde até o lançamento em 2023"),
        Spoiler(title: "Black Panther: Wakanda Forever", spoiler:"Aguarde até o lançamento em 10/11/2022", elenco: "Lupita Nyong'o, Danai Gurira, Martin Freeman, Daniel Kaluuya, Letitia Wright, Winston Duke, Angela Bassett, Dominique Thorne", descricaoCenaPosCreditos: "Aguarde até o lançamento em 10/11/2022"),
        Spoiler(title: "Blade", spoiler: "Aguarde até o lançamento em 03/11/2023", elenco: "ainda não tem lista de elenco", descricaoCenaPosCreditos: "Aguarde até o lançamento em 03/11/2023"),
        Spoiler(title: "The Marvels", spoiler: "Aguarde até o lançamento em 28/07/2023", elenco: "Brie Larson, Teyonah Parris, Iman Vellani, Samuel L. Jackson", descricaoCenaPosCreditos: "Aguarde até o lançamento em 28/07/2023"),
        Spoiler(title: "Thor: Love and Thunder", spoiler: "Aguarde até o lançamento em 07/07/2022", elenco: "Chris Hemsworth, Christian Bale, Tessa Thompson, Jaimie Alexander, Taika Waititi, Russell Crowe, Natalie Portman", descricaoCenaPosCreditos: "Aguarde até o lançamento em 07/07/2022"),
        Spoiler(title: "Doctor Strange in the Multiverse of Madness", spoiler: "Wanda Maximoff é a verdadeira vilã do filme. Com a justificativa de estar novamente junto dos filhos, Wanda faz uso do Darkhold e se transforma em Feiticeira Escarlate, o que causa uma enorme confusão em todo o Multiverso, podendo até mesmo destruí-lo .", elenco: "Benedict Cumberbatch, Elizabeth Olsen, Chiwetel Ejiofor, Benedict Wong, Xochitl Gomez, Michael Stuhlbarg, Rachel McAdams", descricaoCenaPosCreditos: "O filme possui duas cenas pós-créditos.Na primeira cena pós-crédito, Strange sai de casa e é visto andando calmamente pela rua. Mas, de repente, ele é interrompido por uma mulher misteriosa de terno roxo. Ela se aproxima dele e diz que ele causou uma incursão no tempo, e que por isso Strange deve acompanhá-la para resolver esse conflito mágico.Logo na sequência, ela abre um portal para mostrar a Strange o desastre que havia sido gerado na Dimensão das trevas.Antes de viajar para a Dimensão das Trevas com a nova personagem da Marvel, o super-herói recorre ao seu Manto da Levitação e, pela primeira vez, um terceiro olho surge em sua testa.Já a segunda cena pós-créditos não dá informações relevantes sobre o futuro das produções da Marvel. A imagem mostra Bruce Campbell, o ator norte-americano que o diretor Sam Raimi sempre convida para participações em seus longas-metragens. Campbell aparece em duas cenas de Doutor Estranho no Multiverso da Loucura. Primeiro, está em um dos universos paralelos vendendo pizzas em uma barraquinha de rua – mas acaba sendo grosseiro com o Doutor Estranho em um diálogo.Strange, então, acaba punindo o vendedor com um feitiço que o obriga a bater no próprio rosto por três semanas. A segunda aparição é já na última cena pós-créditos, o vendedor percebe que não está mais batendo na cara e, olhando para a câmera, diz: “Acabou!”. E a frase literalmente fecha o filme."),
        Spoiler(title: "Spider-Man: No Way Home", spoiler: "A primeira grande surpresa envolvendo Sem Volta Para Casa é justamente a breve aparição de nada mais, nada menos do que Matt Murdock , Demolidor , como advogado de Peter. Com Ned procurando por seu amigo, o garoto acaba abrindo portais, passando então a descobrir que versões de outros universos do herói também chegaram nesta realidade, essas versões  são justamente as de Andrew Garfield e Tobey Maguire, da mesma forma que os vilões de outros universos chegaram, foram eles o Doutor Otto Octavius , Norman Osborn/Duende Verde , Doutor Curt Connors/Lagarto , Maxwell Dillon/Electro  e Flint Marko/Homem-Areia.  Com a chegada dos vilões, tia May morre durante um ataque do Duende Verde. ", elenco: "Tom Holland, Zendaya, Benedict Cumberbatch, Jacob Batalon, Jon Favreau, Jamie Foxx, Willem Dafoe, Alfred Molina, Benedict Wong, Tony Revolori, Marisa Tomei, Andrew Garfield, Tobey Maguire", descricaoCenaPosCreditos:"o filme possui duas cenas pós-créditos. lembram quando lá no final da sequência de Venom, vimos que Eddie Brock, e Venom, tinham sidos transportados para o Universo do MCU? Então… a primeira cena traz a continuação disso.Nos momentos pós-filme do Homem-Aranha,  Eddie conversa com o garçom de um quiosque lá do hotel que ele estava hospedado sobre os eventos que aconteceram no universo do MCU. Entre um copo e outro, o moço explica algumas coisas para Eddie, com comentários de Venom, sobre os Vingadores, o ataque de Thanos e tudo mais. Até que Eddie começa a brilhar e puf… desaparece.Mas tanto nas cenas pós-crédito de Venom: Tempo de Carnificina quanto de Homem-Aranha; Sem Volta Para Casa, Eddie expressa seu interesse em encontrar o Homem-Aranha e Peter Parker. E quando seu corpo retorna para o seu Universo fica claro que isso deverá ser uma prioridade do lado de lá. Já para a segunda cena, a Marvel Studios colocou o teaser de Doutor Estranho e o Multiverso da Loucura.Assim, vemos que o Doutor Estranho precisa lidar com as consequências dos feitiços que ele criou no filme. Como vimos em Homem-Aranha; Sem Volta Para Casa, ao tentar fazer com que todo mundo esquecesse que Peter Parker era o Homem-Aranha, o feitiço do Doutor Estranho trouxe visitantes de outros universos que sabiam da existência do personagem. Depois, o personagem no final do filme consegue até realizar o feitiço novamente mas causa uma abertura na fenda entre os universos e que foi fechada com um grande custo por ele. Nas cenas de Doutor Estranho 2, vemos o Doutor Estranho falar isso enquanto vemos as cenas dele vagando por Nova York toda destruída, dentro do Sanctum Sanctorum, e com rápidas cenas que envolvem o retorno da Dra. Christine Palmer vestida de noiva em um casamento com Stephen, o Barão Mordo  e muito mais."),
        Spoiler(title: "Eternals", spoiler: "", elenco: "Gemma Chan, Richard Madden, Kumail Nanjiani, Lia McHugh, Brian Tyree Henry, Lauren Ridloff, Barry Keoghan, Don Lee, Harish Patel, Kit Harington, Salma Hayek, Angelina Jolie", descricaoCenaPosCreditos: "O filme possui duas cenas pós-créditos.Na primeira cena, Thena , Makkari  e Druig  estão na nave dos Eternos com intuito de sair por aí, espaço afora, para encontrar outros Eternos e outros planetas para alertá-los sobre os planos de Arishem.Enquanto o trio discute brevemente, a reunião é interrompida pela chegada de um visitante misterioso, que é ninguém mais nem menos do que Eros, irmão mais novo de Thanos! Ele chega acompanhado de Pip, um troll. O trio é alertado de que Sersi, Kingo e Sprite estão em grave perigo na Terra, mas que Eros sabe onde encontrá-los. Na segunda cena pós-créditos de Eternos, Dane Whitman abre um misterioso baú e tira dele uma espada negra, a Lâmina de Ébano. Ao dizer algumas palavras em latim, o personagem ouve uma estranha voz perguntando se ele está pronto"),
        Spoiler(title: "Shang-Chi and The Legend of The Ten Rings", spoiler: "", elenco: "Simu Liu, Awkwafina, Meng'er Zhang, Fala Chen, Florian Munteanu, Benedict Wong, Michelle Yeoh, Ben Kingsley, Tony Leung", descricaoCenaPosCreditos: " O filme possui duas cenas pós-créditos. Na primeira cena, Shang-Chi retorna para São Francisco com sua amiga Katy, onde eles encontram um casal de amigos, que apareceram no começo do filme. Os dois contam detalhes das aventuras que passaram – apesar do casal não acreditar muito.  Tudo isso muda quando Wong chega durante o jantar deles e convoca Shang-Chi e Katy para uma reunião de última hora. Eles são levados ao Sanctum Sanctorum para o encontro com a Capitã Marvel  e Bruce Banner . Eles falam dos Dez Anéis, que estão com Shang-Chi, como um poder que está aparecendo e como há outras coisas no universo que eles não devem conhecer. Também mencionam que há algo nos artefatos atuando como um farol enviando um sinal. Quando Katy e Shang perguntam para onde está enviando, Carol Danvers recebe uma mensagem, e ela e Bruce vão embora.Wong basicamente dá as boas-vindas deles ao time, falando que a vida deles nunca mais será a mesmo, e os três personagens vão para um karaokê e cantam Hotel Califórnia, do Eagles. A segunda cena pós-créditos mostra que, ao invés dela acabar com a estrutura da organização criminosa Dez Anéis criada pelo seu pai, Xialing está assumindo o controle como sua nova líder. Isso abre espaço para a formação de guerreiras, aparecendo diversas mulheres treinando, coisa que não acontecia anteriormente, pois a organiação era formada por homens e Wenwu treinou apenas Shang-Chi em artes marciais e não Xialing, que aprendeu ao assistir os treinamentos deles."),
        Spoiler(title: "Spider-Man: Far From Home", spoiler: "", elenco: "Tom Holland, Samuel L. Jackson, Zendaya, Cobie Smulders, Jon Favreau, J. B. Smoove, Jacob Batalon, Martin Starr, Marisa Tomei, Jake Gyllenhaal", descricaoCenaPosCreditos: "Peter Parker e Michelle Jones terminaram seu encontro no momento em que Pat Kiernan anunciava uma notícia importante. Para o horror de Parker, o editor do Clarim Diário, J. Jonah Jameson, revelou filmagens vazadas por Quentin Beck durante a Batalha de Londres, sugerindo que o Homem-Aranha havia assassinado e orquestrado a morte de milhares de inocentes, em seguida revelando a identidade de Parker como o Homem-Aranha ao mundo. Nick Fury e Maria Hill revelam-se como Talos e Soren disfarçados. Pelo pedido de Soren, Talos contata o verdadeiro Nick Fury, que esteve comandando uma nave de Skrulls, e o informa sobre as complicações inesperadas que enfrentaram em sua missão de impedir os Elementais."),
        Spoiler(title: "Avengers: Endgame", spoiler: "", elenco: "Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth, Scarlett Johansson, Jeremy Renner, Don Cheadle, Paul Rudd, Brie Larson, Karen Gillan, Danai Gurira, Benedict Wong, Jon Favreau, Bradley Cooper, Gwyneth Paltrow, Josh Brolin", descricaoCenaPosCreditos: "O filme não possui cena pós-crédito por se tratar do último filme da Saga do Infinito, colocando assim, um ponto final nesta fase"),
        Spoiler(title: "Avengers: Infinity War", spoiler: "", elenco: "Robert Downey Jr., Chris Hemsworth, Mark Ruffalo, Chris Evans, Scarlett Johansson, Benedict Cumberbatch, Don Cheadle, Tom Holland, Chadwick Boseman, Paul Bettany, Elizabeth Olsen, Anthony Mackie, Sebastian Stan, Danai Gurira, Letitia Wright, Dave Bautista, Zoe Saldaña, Josh Brolin, Chris Pratt", descricaoCenaPosCreditos: "Pressagiando Capitã Marvel, Nick Fury envia um sinal para um indivíduo desconhecido através de um pager, enquanto ele, Maria Hill e outros civis de Atlanta começam a se tornar poeira."),
        Spoiler(title: "Ant-Man and The Wasp", spoiler: "", elenco: "Paul Rudd, Evangeline Lilly, Michael Peña, Walton Goggins, Bobby Cannavale, Judy Greer, Tip T.I. Harris, David Dastmalchian, Hannah John-Kamen, Abby Ryder Fortson, Randall Park, Michelle Pfeiffer, Laurence Fishburne, Michael Douglas", descricaoCenaPosCreditos: "Em uma cena no meio dos créditos, pressagiando Vingadores: Ultimato, Hank Pym, Hope van Dyne e Janet van Dyne assistem Scott Lang adquirir partículas, porém, a família começa a se desintegrar por conta da vitória de Thanos, deixando Scott preso no Reino Quântico. Uma formiga gigante toca a bateria elétrica de Scott Lang enquanto o Emergency Alert System ecoa através da casa de Scott."),
        Spoiler(title: "Thor: Ragnarok", spoiler: "", elenco: "Chris Hemsworth, Tom Hiddleston, Cate Blanchett, Idris Elba, Tessa Thompson, Jeff Goldblum, Karl Urban, Mark Ruffalo, Anthony Hopkins, Matt Damon", descricaoCenaPosCreditos: "Em uma cena na metade dos créditos, pressagiando Vingadores: Guerra Infinita, Loki visita Thor em seu quarto para questioná-lo se levá-lo à Terra era uma boa ideia, porém, uma enorme espaço-nave aparece em frente às suas."),
        Spoiler(title: "Doctor Strange", spoiler: "", elenco: "Benedict Cumberbatch, Chiwetel Ejiofor, Rachel McAdams, Benedict Wong, Michael Stuhlbarg, Benjamin Bratt, Mads Mikkelsen, Tilda Swinton", descricaoCenaPosCreditos: "Em uma cena tirada de Thor: Ragnarok, o Doutor Estranho questiona Thor seu motivo para trazer Loki à Terra. Após descobrir a procura dos irmãos por Odin, Strange oferece sua ajuda na condição que os três retornassem à Asgard após terminar sua busca. Karl Mordo confronta Jonathan Pangborn, tirando sua magia e explicando estar fazendo isto pois há muitos feiticeiros."),
        Spoiler(title: "Black Panther", spoiler: "", elenco: "Chadwick Boseman, Michael B. Jordan, Lupita Nyong'o, Letitia Wright, Martin Freeman, Daniel Kaluuya, Angela Bassett, Winston Duke, Danai Gurira, Andy Serkis, Forest Whitaker", descricaoCenaPosCreditos: "Em uma cena na metade dos créditos, T'Challa visita o Centro Internacional de Viena com Nakia, Okoye e Ayo para falar diante as Organizações Nações Unidas, revelando que Wakanda abrirá sua barreira e utilizará seus recursos para ajudar o restante do mundo. Pressagiando Vingadores: Guerra Infinita, Shuri visita Bucky Barnes, recém-acordado, e o diz que há muito o que aprender."),
        Spoiler(title: "Spider-Man: Homecoming", spoiler: "", elenco: "Tom Holland, Michael Keaton, Jon Favreau, Zendaya, Donald Glover, Jacob Batalon, Laura Harrier, Tony Revolori, Bokeem Woodbine, Tyne Daly, Marisa Tomei, Robert Downey Jr.", descricaoCenaPosCreditos: "Adrian Toomes encontra Mac Gargan na prisão, informando Toomes que ele procura por amigos para matar o Homem-Aranha. Mac confronta Adrian, questionando-o sobre os rumores de Toomes saber sobre a identidade do herói. Adrian nega os rumores de saber a identidade secreta do Homem-Aranha, e sai para encontrar sua família. Capitão América aparece para falar a importância da paciência, em seguida quebrando a quarta parede para informar ao público que eles esperaram por nada."),
        Spoiler(title: "Black Widow", spoiler: "", elenco: "Scarlett Johansson, Florence Pugh, David Harbour, O-T Fagbenle, Olga Kurylenko, William Hurt, Ray Winstone, Rachel Weisz", descricaoCenaPosCreditos: nil),
        Spoiler(title: "Captain America: Civil War", spoiler: "", elenco: "Chris Evans, Robert Downey Jr., Scarlett Johansson, Sebastian Stan, Daniel Brühl, Chadwick Boseman, Elizabeth Olsen, Emily VanCamp, Don Cheadle, Paul Bettany, Jeremy Renner, Anthony Mackie, Paul Rudd, William Hurt, Martin Freeman, Tom Holland, Frank Grillo, Marisa Tomei", descricaoCenaPosCreditos: "Em uma cena na metade dos créditos, pressagiando Pantera Negra, Steve Rogers observa Bucky Barnes ser colocado em um sono criogênico, ele agradece T'Challa por dar-lhes abrigo em Wakanda até que uma cura para o programa mental de Bucky possa ser encontrado. Pressagiando Homem-Aranha: De Volta ao Lar, Peter Parker descansa em sua cama enquanto Tia May cuida de seus ferimentos. Ao sair da sala, Peter inspeta seus Lançadores de Teia e observa eles emitirem um sinal semelhante à uma aranha."),
        Spoiler(title: "Ant-Man", spoiler: "", elenco: "Paul Rudd, Evangeline Lilly, Corey Stoll, Bobby Cannavale, Michael Peña, Tip T.I. Harris, Anthony Mackie, Wood Harris, Judy Greer, David Dastmalchian, Michael Douglas", descricaoCenaPosCreditos: "Pressagiando Capitão América: Guerra Civil, o Capitão América e o Falcão prenderam/localizaram o Soldado Invernal em uma localização remota onde seu braço protético está preso em um grande torno. O Falcão pergunta ao Capitão América se deveria ligar para o Homem de Ferro, mas ele se nega. Então, o Falcão diz que sabe para quem ligar, implicando o Homem-Formiga."),
        Spoiler(title: "Avengers: Age of Ultron", spoiler: "", elenco: "Robert Downey Jr., Chris Hemsworth, Mark Ruffalo, Chris Evans, Scarlett Johansson, Jeremy Renner, James Spader, Don Cheadle, Aaron Taylor-Johnson, Elizabeth Olsen, Paul Bettany, Cobie Smulders, Anthony Mackie, Hayley Atwell, Idris Elba, Stellan Skarsgård, Linda Cardellini, Thomas Kretschmann, Claudia Kim, Andy Serkis, Samuel L. Jackson", descricaoCenaPosCreditos: "Thanos, cansado dos fracassos constantes de seus peões de adquirirem as Joias do Infinito para ele, recupera uma Manopla do Infinito e declara que agora irá caçar as joias ele próprio."),
        Spoiler(title: "Guardians of the Galaxy Vol. 2", spoiler: "", elenco: "Chris Pratt, Zoe Saldaña, Dave Bautista, Vin Diesel, Bradley Cooper, Michael Rooker, Karen Gillan, Pom Klementieff, Elizabeth Debicki, Chris Sullivan, Sean Gunn, Sylvester Stallone, Kurt Russell", descricaoCenaPosCreditos: "Em uma cena antes dos créditos, Kraglin Obfonteri tenta usar a Flecha Yaka, mas acidentalmente acaba atingindo Drax. Stakar Ogord, inspirado pelo sacrifício de Yondu Udonta, reúne Aleta Ogord e seus companheiros, Martinex, Charlie-27, Krugarr e Mainframe para voltarem com sua antiga equipe. Ayesha decide criar um ser capaz de destruir os Guardiões da Galáxia, batizando-o de Adam. Peter Quill entra no quarto de um Groot adolescente, que está jogando vídeo game, e demonstra desgosto pelas raízes que está no quarto do mesmo. Groot responde de forma de zombamento, irritando Quill. Os Vigias abandonam seu informante enquanto o mesmo implora para a espécie ouvir suas aventuras."),
        Spoiler(title: "Guardians of the Galaxy", spoiler: "", elenco: "Chris Pratt, Zoe Saldana, Dave Bautista, Vin Diesel, Bradley Cooper, Lee Pace, Michael Rooker, Karen Gillan, Djimon Hounsou, John C. Reilly, Glenn Close, Benicio Del Toro", descricaoCenaPosCreditos: "Groot, como um broto, dança ao som do The Jackson 5 na Milano enquanto Drax, o Destruidor afia sua faca. Quando Drax olha pra trás, Groot congela, e continua a dançar quando ele para de olhar. Taneleer Tivan senta-se entre o que restou de seu museu em Luganenhum, aparentemente intrépido após o desastre. Enquanto Cosmo lambe seu rosto, outro membro de sua coleção, Howard, o Pato, zomba do Colecionador."),
        Spoiler(title: "Captain America: The Winter Soldier", spoiler: "", elenco: "Chris Evans, Scarlett Johansson, Sebastian Stan, Anthony Mackie, Cobie Smulders, Frank Grillo, Emily VanCamp, Hayley Atwell, Robert Redford, Samuel L. Jackson", descricaoCenaPosCreditos: "Em uma cena na metade dos créditos pressagiando Vingadores: Era de Ultron, Wolfgang von Strucker é visto em uma base secreta, onde vários objetos, incluindo o Cetro, estão sendo estudados. Strucker para em frente à um par de celas de contenção, onde os gêmeos Mercúrio e Feiticeira Escarlate estão contidos. Após a Batalha no Triskelion, o Soldado Invernal vai à exposição do Capitão América no Instituto Smithsoniano, onde vê informações sobre Bucky Barnes, colocando alguma luz em seu passado."),
        Spoiler(title: "Thor: The Dark World", spoiler: "", elenco: "Chris Hemsworth, Natalie Portman, Tom Hiddleston, Anthony Hopkins, Stellan Skarsgård, Idris Elba, Christopher Eccleston, Adewale Akinnuoye-Agbaje, Kat Dennings, Ray Stevenson, Zachary Levi, Tadanobu Asano, Jaimie Alexander, Rene Russo", descricaoCenaPosCreditos: " Na primeira cena, vemos Sif e Volstagg levando o Aether para a posse do Museu Intergalático, que aparentemente tem o Coletor como curador. A ideia é deixar essa gema do Infinito na posse de outro, já que Asgard tem a Joia da Mente. Uma vez de posse do objeto, o Coletor apenas diz ~ uma a menos, mais cinco por vir ~. Já a segunda cena pós credito é bem relevante. Ao que parece, Thor decide que vai ficar em Midgard com Jane e já serviço para fazer já que surge uma fera de Jotunheim aparece escapando provavelmente de um portal aberto na última batalha em Londres. "),
        Spoiler(title: "Iron Man 3", spoiler: "", elenco: "Robert Downey Jr., Gwyneth Paltrow, Don Cheadle, Guy Pearce, Rebecca Hall, Stéphanie Szostak, James Badge Dale, Jon Favreau, Ben Kingsley", descricaoCenaPosCreditos:"Na cena, vemos Tony Stark (Robert Downey Jr) contando os acontecimentos do filme para Bruce Banner, que adormeceu. Enquanto isso é usado para rir, Tony Stark sentando-se com Bruce para uma sessão de terapia improvisada mostra-o lutando com a preocupação de não poder salvar a todos, o que o leva a criar Ultron"),
        Spoiler(title: "The Avengers", spoiler: "", elenco: "Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth, Scarlett Johansson, Jeremy Renner, Tom Hiddleston, Clark Gregg, Cobie Smulders, Stellan Skarsgård, Samuel L. Jackson", descricaoCenaPosCreditos: "Os Vingadores é o primeiro filme com duas cenas pós-créditos. A primeira cena ocorre no meio e apresenta o titã louco, Thanos. Nós o vemos aprender sobre a derrota de Loki nas mãos dos Vingadores. A segunda cena é uma das cenas pós-créditos mais famosas da Marvel: Os exaustos Vingadores, depois de defender Nova York e derrotar um gigantesco exército alienígena invasor, se reúnem para um Shawarma, ou algo para comer."),
        Spoiler(title: "Thor", spoiler: "", elenco: "Chris Hemsworth, Natalie Portman, Tom Hiddleston, Stellan Skarsgård, Colm Feore, Ray Stevenson, Idris Elba, Kat Dennings, Rene Russo, Anthony Hopkins", descricaoCenaPosCreditos: "Ele mostra os eventos do primeiro filme dos Vingadores; vemos Nick Fury dar as boas-vindas a Erik Selvig em uma instalação do Shield para que ele possa começar a estudar o Tesseract. No entanto, Selvig está sob o controle de Loki"),
        Spoiler(title: "The Incredible Hulk", spoiler: "", elenco: "Edward Norton, Liv Tyler, Tim Roth, William Hurt, Tim Blake Nelson, Ty Burrell", descricaoCenaPosCreditos: nil),
        Spoiler(title: "Iron Man 2", spoiler: "", elenco: "Robert Downey Jr., Gwyneth Paltrow, Don Cheadle, Scarlett Johansson, Sam Rockwell, Mickey Rourke, Samuel L. Jackson", descricaoCenaPosCreditos: "Esta cena pós-créditos nada mais é do que um teaser direto para Thor, que foi lançado um ano após a estreia de Homem de Ferro 2. A cena mostra o Agente do Escudo Phil Coulson (Clark Gregg) chegando a um deserto no Novo México antes de a cena revelar o Martelo de Thor no centro de uma cratera."),
        Spoiler(title: "Iron Man", spoiler: "", elenco: "Robert Downey Jr., Terrence Howard, Jeff Bridges, Shaun Toub, Gwyneth Paltrow", descricaoCenaPosCreditos: "Nesta cena, vemos Tony Stark, que - após revelar sua identidade como Homem de Ferro - volta para casa para encontrar Nick Fury esperando para admitir que o Homem de Ferro não é o único super-herói do mundo"),
        Spoiler(title: "Captain Marvel", spoiler: "", elenco: "Brie Larson, Samuel L. Jackson, Ben Mendelsohn, Djimon Hounsou, Lee Pace, Lashana Lynch, Gemma Chan, Annette Bening, Clark Gregg, Jude Law", descricaoCenaPosCreditos: nil),
        Spoiler(title: "Captain America: The First Avenger", spoiler: "", elenco: "Chris Evans, Tommy Lee Jones, Hugo Weaving, Hayley Atwell, Sebastian Stan, Dominic Cooper, Neal McDonough, Derek Luke, Stanley Tucci", descricaoCenaPosCreditos: "Nesta cena, é possível ver mais prenúncios para o primeiro filme dos Vingadores, que lançou um ano depois. Steve Rodgers está fazendo seu treino usual de explodir sacos de pancadas com os punhos quando Nick Fury aparece e pede ajuda para salvar o mundo.")
        
    ]
    
}
