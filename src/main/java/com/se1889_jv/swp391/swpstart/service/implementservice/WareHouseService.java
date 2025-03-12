package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.WareHouse;
import com.se1889_jv.swp391.swpstart.domain.dto.request.WareHouseCreationRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.response.WareHouseDetailResponse;
import com.se1889_jv.swp391.swpstart.repository.StoreRepository;
import com.se1889_jv.swp391.swpstart.repository.WareHouseRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IWareHouseService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class WareHouseService implements IWareHouseService {

    private final WareHouseRepository wareHouseRepository;
    private final StoreRepository storeRepository;

    @Override
    public void createWareHouse(WareHouseCreationRequest request) {
        Store store = storeRepository.findById(request.getId()).orElse(null);
        WareHouse wareHouse = WareHouse.builder()
                .name(request.getName())
                .store(store)
                .build();

        wareHouseRepository.save(wareHouse);
    }

    @Override
    public List<WareHouse> getAllWareHouse(Store store) {
        return List.of();
    }

    public Page<WareHouse> getAllWareHouse(Store store, int page, int size, String sort, String order) {
        Sort.Direction direction = order.equalsIgnoreCase("desc") ? Sort.Direction.DESC : Sort.Direction.ASC;
        Sort sortObj = Sort.by(direction, sort);
        PageRequest pageable = PageRequest.of(page, size, sortObj);

        return wareHouseRepository.findByStore(store, pageable);
    }
    @Override
    public WareHouse getWareHouseById(long id) {
        Optional<WareHouse> warehouse = this.wareHouseRepository.findById(id);
        if (warehouse.isPresent()) {
            return warehouse.get();
        }
        return null;

    }

    @Override
    public boolean existsWareHouseByName(String name, Store store) {
        return this.wareHouseRepository.existsByNameAndStore(name, store);
    }

    @Override
    public void updateWareHouse(WareHouse warehouse) {
        WareHouse oldWarehouse = this.getWareHouseById(warehouse.getId());
        if (oldWarehouse != null) {
            oldWarehouse.setName(warehouse.getName());
        }
        assert oldWarehouse != null;
        this.wareHouseRepository.save(oldWarehouse);
    }

    @Override
    public List<WareHouse> getAllWareHouseByListStore(List<Store> store) {
        return wareHouseRepository.findAllByStoreIn(store);
    }

    @Override
    public List<WareHouseDetailResponse> getAll() {
        return wareHouseRepository.findAll()
                .stream().map(wareHouse -> WareHouseDetailResponse.builder()
                        .id(wareHouse.getId())
                        .name(wareHouse.getName())
                        .storeId(wareHouse.getStore().getId())
                        .storeName(wareHouse.getStore().getName())
                        .build())
                .toList();
    }

    public List<WareHouse> searchWareHouseByName(String name) {
        return wareHouseRepository.findByNameContaining(name);
    }

    public Page<WareHouse> getWareHousesWithPagination(int page, int size, Store store) {
        Pageable pageable = PageRequest.of(page, size);
        return wareHouseRepository.findByStore(store, pageable);
    }


}
