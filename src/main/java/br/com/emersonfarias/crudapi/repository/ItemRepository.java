package br.com.emersonfarias.crudapi.repository;

import br.com.emersonfarias.crudapi.model.Item;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ItemRepository extends JpaRepository<Item, Long> {
}
