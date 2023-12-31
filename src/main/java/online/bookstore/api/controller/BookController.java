package online.bookstore.api.controller;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.persistence.EntityNotFoundException;
import jakarta.validation.Valid;
import online.bookstore.api.domain.author.Author;
import online.bookstore.api.domain.author.AuthorRepository;
import online.bookstore.api.domain.book.Book;
import online.bookstore.api.domain.book.BookRepository;
import online.bookstore.api.domain.book.DadosCadastroBook;
import online.bookstore.api.domain.publisher.Publisher;
import online.bookstore.api.domain.publisher.PublisherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/livros")
@SecurityRequirement(name = "bearer-key")
public class BookController {

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private AuthorRepository authorRepository;

    @Autowired
    private PublisherRepository publisherRepository;

    @PostMapping()
    public void cadastrar(@RequestBody @Valid DadosCadastroBook dados) {
        if (dados == null || dados.autorId() == null || dados.editoraId() == null) {
            throw new IllegalArgumentException("AutorId or EditoraId cannot be null");
        }


        Author author = authorRepository.findById(dados.autorId())
                .orElseThrow(() -> new EntityNotFoundException("Autor não encontrado"));

        Publisher publisher = publisherRepository.findById(dados.editoraId())
                .orElseThrow(() -> new EntityNotFoundException("Editora não encontrada"));

        // Criar e salvar o novo livro
        Book newBook = new Book(dados, author, publisher);
        bookRepository.save(newBook);
    }


    @GetMapping()
    public List<Book> listarBook(){
        return bookRepository.findAll();
    }

    @DeleteMapping("{id}")
    public void excluirBook(@PathVariable Long id){bookRepository.deleteById(id);}



}

