package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.*;
import com.se1889_jv.swp391.swpstart.domain.dto.request.WareHouseCreationRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.response.PageResponse;
import com.se1889_jv.swp391.swpstart.domain.dto.response.WareHouseDetailResponse;
import com.se1889_jv.swp391.swpstart.repository.StoreRepository;
import com.se1889_jv.swp391.swpstart.repository.UserRepository;
import com.se1889_jv.swp391.swpstart.repository.WareHouseRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IWareHouseService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class WareHouseService implements IWareHouseService {

    private final WareHouseRepository wareHouseRepository;
    private final StoreRepository storeRepository;
    private final UserRepository userRepository;

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
    @Transactional
    public PageResponse<WareHouseDetailResponse> getAll(int page, int size) {
        User user = Utility.getUserInSession();
        assert user != null;
        List<Store> stores = user.getUserStores().stream()
                .map(UserStore::getStore)
                .toList();

        List<WareHouse> allWareHouses = stores.stream()
                .flatMap(store -> store.getWareHouses().stream())
                .toList();

        int totalElements = allWareHouses.size();
        int totalPages = (int) Math.ceil((double) totalElements / size);
        int skip = (page - 1) * size;

        List<WareHouse> pagedWareHouses = allWareHouses.stream()
                .skip(skip)
                .limit(size)
                .toList();

        List<WareHouseDetailResponse> wareHouseDetails = pagedWareHouses.stream()
                .map(wareHouse -> WareHouseDetailResponse.builder()
                        .id(wareHouse.getId())
                        .name(wareHouse.getName())
                        .storeId(wareHouse.getStore().getId())
                        .storeName(wareHouse.getStore().getName())
                        .build())
                .toList();

        return PageResponse.<WareHouseDetailResponse>builder()
                .currentPage(page)
                .pageSize(size)
                .totalElements(totalElements)
                .totalPages(totalPages)
                .data(wareHouseDetails)
                .build();
    }

    public List<WareHouse> searchWareHouseByName(String name) {
        return wareHouseRepository.findByNameContaining(name);
    }

    public Page<WareHouse> getWareHousesWithPagination(int page, int size, Store store) {
        Pageable pageable = PageRequest.of(page, size);
        return wareHouseRepository.findByStore(store, pageable);
    }

    public List<WareHouse> findByStore(Long id) {
        Store store = storeRepository.findById(id).orElse(null);
        assert store != null;
        return store.getWareHouses();
    }

    public List<Product> getProductsByWarehouseAndUser(Long warehouseId, User user) {
        WareHouse warehouse = wareHouseRepository.findById(warehouseId).orElse(null);
        if (warehouse == null) {
            return List.of();
        }

        // Lấy danh sách cửa hàng mà user sở hữu
        List<Long> storeIds = user.getUserStores().stream()
                .map(userStore -> userStore.getStore().getId())
                .toList();

        // Lấy danh sách sản phẩm trong kho, chỉ giữ lại sản phẩm thuộc cửa hàng của user
        return warehouse.getProducts().stream()
                .filter(product -> storeIds.contains(product.getStore().getId()) && product.getTotalQuantity() > 0)
                .toList();
    }


}
