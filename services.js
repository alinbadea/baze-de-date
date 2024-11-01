class FileService {
    #jsonPath = './data/data.json';

    async loadTextFile(path) {        
        const data = await fetch(path);
        if(!data.ok && data.status !== 200) {
            return data.statusText || "Not found";
        }
        const html = await data.text();
        return html;
    }

    async loadJsonFile() {
        const data = await fetch(this.#jsonPath);
        const json = await data.json();
        return json.sections;
    }
}

class UIService {
    #keyAttr = 'key';
    #menu = document.querySelector('#navbar');
    constructor(){
        
    }

    displayData(items) {
        const cnt = items.length;
        for(let i=0; i<cnt; i++){
            this.#createSection(items[i]);
        }
    }
    handleMenuSelection(id) {
        const items = this.#menu.querySelectorAll('.nav-item');
        items.forEach(item => {
            item.classList.remove('active');
        });
        const selected = this.#menu.querySelector(`[${this.#keyAttr}="${id}"]`);
        selected.classList.add('active');
    }
    #createSection(section) {
        if(section === null || section === undefined || section.show === null || section.show === undefined || section.show===false) return;
        const div = document.createElement('div');
        div.setAttribute(this.#keyAttr, section.id);
        div.classList.add('nav-item');
        div.innerHTML = `<a class="nav-link">${section.title}</a>`;
        this.#menu.appendChild(div);
    }
    
}

export const fileService = new FileService();
export const uiService = new UIService();