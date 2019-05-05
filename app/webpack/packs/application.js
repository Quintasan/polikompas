/* eslint no-console:0 */
import "controllers"
import {MDCTextField} from "@material/textfield/index";
import {MDCList} from '@material/list/index';
import {MDCRipple} from '@material/ripple/index';
import {MDCTopAppBar} from '@material/top-app-bar/index';

document.addEventListener("DOMContentLoaded", function(event) {
  const topAppBarElement = document.querySelector('.mdc-top-app-bar');
  const topAppBar = new MDCTopAppBar(topAppBarElement);
  const buttons = [].map.call(document.querySelectorAll(".mdc-text-field"), (el) => { return new MDCTextField(el); });
  const lists = [].map.call(document.querySelectorAll(".mdc-list"), (el) => { return new MDCList(el); });
  lists.map((list) => {
    list.listElements.map((listItemEl) => new MDCRipple(listItemEl));
  });
});
