import { Controller } from "@hotwired/stimulus"
// @hotwired/stimulus는 주로 터보스트림과 함께 사용되어 웹 페이지에 동적으로 자바스크립트 기능을 추가하고자 할 때 사용됨.
// stimulus는 html클래스를 사용하여 간편하게 컨트롤러를 정의고 이를 통해 html과 상호작용할 수 있는 자바스크립트를 작성케함.
// Stimulus를 사용하여 특정 html요소에 대한 이벤트를 감지하고, 해당 이벤트에 대한 동작을 정의하여 동적으로 페이지를 업데이트 할수 있음


export default class extends Controller {
  connect() {
    console.log("debounce controller connected")
  }
  static targets = ["form"]
  // Stimulus에서는 view에서 지정한 data-target 속성을 사용하여 특정 html 요소를 참조하고 상호작용함.
  // static targets = ["form"]은 view에서 debounce_target:"form" 으로 인해 전달된 것임
  // 이를 통해 this로 해당 form에 엑세스 가능해졌음
  search() {
    clearTimeout(this.timeout) // 이전에 설정된 타임아웃(setTimeout()으로 설정된 딜레이를)을 취소하는 역할
    // timeout은 자바스크립트에서 딜레이를 처리하는데 사용되는 변수 이름
    this.timeout = setTimeout(() => {
        this.formTarget.requestSubmit()
    }, 500)

  }
}
