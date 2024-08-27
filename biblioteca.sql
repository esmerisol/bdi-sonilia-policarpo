create database Biblioteca;
use Biblioteca;
CREATE TABLE Autor (
idautor INT PRIMARY KEY,
nome varchar(80),
nacionalidade varchar(50),
datanascimento date
);

CREATE TABLE Categoria (
    idcategoria INT PRIMARY KEY,
    nomecategoria varchar(50)
);

CREATE TABLE Editora (
    ideditora INT PRIMARY KEY,
    nomeeditora varchar(100),
    paisorigem varchar(50)
);

CREATE TABLE Cargo (
    idcargo INT PRIMARY KEY,
    nomeCargo varchar(50),
    salario decimal(10,2)
);

CREATE TABLE Funcionario (
    idfuncionario INT PRIMARY KEY,
    nome varchar(100),
    idcargo int,
    Data_Contratacao date,
    FOREIGN KEY (idcargo) REFERENCES Cargo(idcargo)
);

CREATE TABLE Livro (
    idlivro INT PRIMARY KEY,
    titulo varchar(150),
    isbn varchar(13),
    anopublicacao int,
    idautor int,
    ideditora int,
    idcategoria INT,
    FOREIGN KEY (idautor) REFERENCES Autor(idautor),
    FOREIGN KEY (ideditora) REFERENCES Editora(ideditora),
    FOREIGN KEY (idcategoria) REFERENCES Categoria(idcategoria)
);

CREATE TABLE Exemplar (
    idexemplar INT PRIMARY KEY,
    idlivro INT,
    Numero_Exemplar INT,
    Estado_Conservacao VARCHAR(50),
    FOREIGN KEY (idlivro) REFERENCES Livro(idlivro)
);

CREATE TABLE Usuario (
    ID_Usuario INT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(150),
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    Data_Cadastro DATE
);

CREATE TABLE Emprestimo (
    ID_Emprestimo INT PRIMARY KEY,
    ID_Usuario INT,
    ID_Exemplar INT,
    Data_Emprestimo DATE,
    Data_Devolucao_Prevista DATE,
    Data_Devolucao_Real DATE,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
    FOREIGN KEY (ID_Exemplar) REFERENCES Exemplar(ID_Exemplar)
);

CREATE TABLE Caixa (
    ID_Caixa INT PRIMARY KEY,
    ID_Funcionario INT,
    Data_Abertura DATE,
    Data_Fechamento DATE,
    Valor_Inicial DECIMAL(10, 2),
    Valor_Final DECIMAL(10, 2),
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE NotaFiscal (
    ID_NotaFiscal INT PRIMARY KEY,
    ID_Caixa INT,
    Data_Emissao DATE,
    Valor_Total DECIMAL(10, 2),
    Forma_Pagamento VARCHAR(50),
    FOREIGN KEY (ID_Caixa) REFERENCES Caixa(ID_Caixa)
);
