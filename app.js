import { fileService, uiService } from './services.js';

document.addEventListener('DOMContentLoaded', load);

const menu = document.querySelector('#navbar');
const page = document.querySelector('#main-content');

let dataItems;

async function load() {    
    dataItems = await fileService.loadJsonFile();
    uiService.displayData(dataItems);

    menu.addEventListener('click', onNavClick);
}


async function onNavClick(e) {
    e.preventDefault();
    const el = e.target;
    const div = el.closest('.nav-item');
    let id = parseInt(div.getAttribute('key'));
    
    let section = dataItems.find(item => item.id === id);
    const html = await fileService.loadTextFile(section.content);
    page.innerHTML = html;
    
    if(section.hasOwnProperty('customLogic')){
        //load extra modules
    }

    uiService.handleMenuSelection(id);
}

