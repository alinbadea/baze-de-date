import { fileService, uiService } from './services.js';

window.oncontextmenu = function () {
    return false;
};

document.addEventListener('DOMContentLoaded', load);
// document.addEventListener('keydown', (e)=>{
//     if(e.key === 'F12' || 
//         (e.ctrlKey && e.shiftKey && (e.key === 'I' || e.key==='J')) ||
//         (e.ctrlKey || e.key === 'S')){
//         e.preventDefault();
//         return false;
//     };
// });
const menu = document.querySelector('#navbar');
const page = document.querySelector('#main-content');

let dataItems;

async function load() {    
    dataItems = await fileService.loadJsonFile();
    uiService.displayData(dataItems);

    menu.addEventListener('click', onNavClick);
    page.addEventListener('click', onClick);
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

async function onClick(e) {
    e.preventDefault();
    if(e.target.getAttribute('id')!='downloadLink'){
        return;
    }
    fileService.downloadFile();
}