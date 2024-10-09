package br.com.emersonfarias.crudapi.service;

import br.com.emersonfarias.crudapi.model.Item;
import br.com.emersonfarias.crudapi.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ItemService {

    @Autowired
    private ItemRepository itemRepository;

    public List<Item> getAllItems() {
        return itemRepository.findAll();
    }

    public Optional<Item> getItemById(Long id) {
        return itemRepository.findById(id);
    }

    public Item saveItem(Item item) {
        return itemRepository.save(item);
    }

    public Optional<Item> updateItem(Long id, Item item) {
        return itemRepository.findById(id).map(existingItem -> {
            existingItem.setName(item.getName());
            existingItem.setDescription(item.getDescription());
            return itemRepository.save(existingItem);
        });
    }

    public boolean deleteItem(Long id) {
        return itemRepository.findById(id).map(item -> {
            itemRepository.delete(item);
            return true;
        }).orElse(false);
    }
}
