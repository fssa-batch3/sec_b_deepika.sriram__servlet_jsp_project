const searchedCity = new URLSearchParams(window.location.search).get("city");
const hospital = JSON.parse(localStorage.getItem("hospital_detail"));

if (!searchedCity) {
    for (let i = 0; i < hospital.length; i++) {
        const hospitalDetail = hospital[i];

        const card = `
                <div class="card">
                    <div>
                        <img src="${hospitalDetail.image_link}";
                    </div>
                    <div>
                        <h3>${hospitalDetail.hospital_name}</h3>    
                    </div> 
                    <div>
                        <a href="../other pages/doctor's list.html?hospital-id=${hospitalDetail.hospital_id}">
                            <button type="button">View hospital</button>    
                        </a>    
                    </div> 
                </div>
            `;
        document.querySelector("main").insertAdjacentHTML("beforeend", card);
        // search();
    }
} 
else {
    for (let i = 0; i < hospital.length; i++) {
        const hospitalDetail = hospital[i];
        if (searchedCity === hospital[i].city.toLowerCase()) {
            const card = `
                <div class="card">
                    <div>
                        <img src="${hospitalDetail.image_link}";
                    </div>
                    <div>
                        <h3>${hospitalDetail.hospital_name}</h3>    
                    </div> 
                    <div>
                        <a href="../other pages/doctor's list.html?hospital-id=${hospitalDetail.hospital_id}">
                            <button type="button">View hospital</button>    
                        </a>    
                    </div> 
                </div>
                `;
            document.querySelector("main").insertAdjacentHTML("beforeend", card);

            // search();
        }
    }
}