CREATE TABLE USUARIO(	email VARCHAR (320),
						login VARCHAR (30),
						senha VARCHAR(40),
			PRIMARY KEY (email));
            
CREATE TABLE PESSOA_FISICA(	email VARCHAR (320),
							nome VARCHAR (255),
							cpf VARCHAR (11),
							rg VARCHAR(14),
                            telefone VARCHAR(14),
                            logradouro VARCHAR(150),
                            numero VARCHAR(20),
                            complemento VARCHAR(50),
                            bairro VARCHAR(50),
                            cidade  VARCHAR(50),
                            estado VARCHAR(50),
                            
			PRIMARY KEY (email), 
			FOREIGN KEY (email) REFERENCES USUARIO(email)); 
            
CREATE TABLE PESSOA_JURIDICA(	email VARCHAR (320),
								razao_social VARCHAR (255),
								nome_fantasia VARCHAR (255),
								cnpj VARCHAR(18),
								telefone VARCHAR(14),
								logradouro VARCHAR(150),
								numero VARCHAR(20),
								complemento VARCHAR(50),
								bairro VARCHAR(50),
								cidade  VARCHAR(50),
								estado VARCHAR(50),
                            
			PRIMARY KEY (email),
			FOREIGN KEY (email) REFERENCES USUARIO(email));  


CREATE TABLE PEDIDO(id_pedido INTEGER  auto_increment,
					data_pedido DATE,
					preco_total REAL,
                    email_usuario VARCHAR (320) NOT NULL,
			PRIMARY KEY (id_pedido),
            FOREIGN KEY (email_usuario) REFERENCES USUARIO(email));  

            
            
CREATE TABLE PRODUTO(	id_produto INTEGER,
						nome VARCHAR (255),
						descricao VARCHAR(1000),
						preco_venda REAL,
						categoria VARCHAR(50),
			PRIMARY KEY (id_produto));
        
        
CREATE TABLE PEDIDO_PRODUTO(id_pedido INTEGER,
							id_produto INTEGER,
							quantidade INTEGER,
			PRIMARY KEY (id_pedido, id_produto),
            FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido),
            FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto));  
        
            
CREATE TABLE FORNECEDOR(id_fornecedor INTEGER,
						razao_social VARCHAR (255),
						nome_fantasia VARCHAR (255),
						cnpj VARCHAR(18),
						telefone VARCHAR(14),
						logradouro VARCHAR(150),
						numero VARCHAR(20),
						complemento VARCHAR(50),
						bairro VARCHAR(50),
						cidade  VARCHAR(50),
						estado VARCHAR(50),
			PRIMARY KEY (id_fornecedor));
            

CREATE TABLE ORIGEM_PRODUTO(id_fornecedor INTEGER,
							id_produto INTEGER,
			PRIMARY KEY (id_fornecedor, id_produto),
            FOREIGN KEY (id_fornecedor) REFERENCES FORNECEDOR(id_fornecedor),
            FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto));  
            
            
CREATE TABLE FUNCIONARIO(	id_funcionario INTEGER,
							nome VARCHAR(255),
                            cpf VARCHAR (11),
							rg VARCHAR(14),
							cargo VARCHAR(50),
                            data_nascimento DATE,
                            telefone VARCHAR(14),
                            logradouro VARCHAR(150),
                            numero VARCHAR(20),
                            complemento VARCHAR(50),
                            bairro VARCHAR(50),
                            cidade  VARCHAR(50), 
                            estado VARCHAR(50),
                            id_departamento_responsavel INTEGER,
			PRIMARY KEY (id_funcionario),
            FOREIGN KEY (id_departamento_responsavel) REFERENCES DEPARTAMENTO(id_departamento)); 
            

CREATE TABLE DEPARTAMENTO(	id_departamento INTEGER,
							nome_departamento VARCHAR(255),
							funcao VARCHAR(50),
                            id_funcionario_gerente INTEGER,
			PRIMARY KEY (id_departamento),
            FOREIGN KEY (id_funcionario_gerente) REFERENCES FUNCIONARIO(id_funcionario));
            

CREATE TABLE TRABALHA_EM(	id_funcionario INTEGER,
							id_departamento INTEGER,
			PRIMARY KEY (id_funcionario, id_produto),
            FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIO(id_funcionario),
            FOREIGN KEY (id_departamento) REFERENCES DEPARTAMENTO(id_departamento)); 


CREATE TABLE CENTRO_DISTRIBUICAO(	id_centro_distribuicao INTEGER,
									nome VARCHAR(255),
									quantidade_itens INTEGER,
									logradouro VARCHAR(150),
									numero VARCHAR(20),
									complemento VARCHAR(50),
									bairro VARCHAR(50),
									cidade  VARCHAR(50),
									estado VARCHAR(50),
                                    id_departamento_responsavel INTEGER,
			PRIMARY KEY (id_centro_distribuicao),
            FOREIGN KEY (id_departamento_responsavel) REFERENCES DEPARTAMENTO(id_departamento)); 
            
            
CREATE TABLE ESTOQUE(	id_estoque INTEGER,
						nome VARCHAR(255),
						quantidade_itens INTEGER,
						capacidade INTEGER,
                        id_centro_distribuicao INTEGER NOT NULL,
                        id_departamento_responsavel INTEGER,
			PRIMARY KEY (id_estoque),
            FOREIGN KEY (id_centro_distribuicao) REFERENCES CENTRO_DISTRIBUICAO(id_centro_distribuicao), 
			FOREIGN KEY (id_departamento_responsavel) REFERENCES DEPARTAMENTO(id_departamento)); 
            

CREATE TABLE ARMAZENA_PRODUTO(	id_estoque INTEGER,
								id_produto INTEGER,
			PRIMARY KEY (id_estoque, id_produto),
            FOREIGN KEY (id_estoque) REFERENCES ESTOQUE(id_estoque),
            FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)); 

            

            
            

            