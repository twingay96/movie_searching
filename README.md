![image](https://github.com/twingay96/movie_searching/assets/64403357/c64b19d0-6433-4970-9511-b6c0a475c91b)

data 속성을 사용하여 Stimulus.js에 필요한 정보를 전달합니다.

controller: "debounce"는 해당 폼에 적용될 Stimulus 컨트롤러의 이름을 나타냅니다.

debounce_target: "form"은 디바운싱을 적용할 대상을 나타냅니다. 
이 경우, form을 지정하여 폼 전체에서 디바운싱을 수행하도록 지정,

data: { action: "input -> debounce#search" } 부분은 Stimulus.js에서 사용되는 데이터 속성으로, 이것은 이벤트와 컨트롤러의 액션을 연결하는데 사용됩니다.

input은 HTML input 엘리먼트에서 발생하는 이벤트 중 하나입니다. 
input 이벤트는 사용자가 텍스트 필드에 입력할 때 발생합니다.
input 이벤트가 발생했을 때, debounce 컨트롤러의 search 액션이 실행됩니다.

debounce는 해당 이벤트를 처리할 Stimulus 컨트롤러의 이름을 나타냅니다.
search는 debounce 컨트롤러 내에서 정의된 액션(메소드)의 이름입니다. 

이 경우, 사용자가 텍스트를 입력할 때마다 search 액션이 실행될 것입니다.
따라서 사용자가 검색어를 입력할 때마다 debounce 컨트롤러의 search 액션이 실행되어 
디바운싱이 적용된 상태에서 서버로 검색 요청을 보낼 것입니다.

![image](https://github.com/twingay96/movie_searching/assets/64403357/92339b6d-d289-4a10-b7d2-2e6988009d96)

clearTimeout(this.timeout)는 JavaScript에서 사용되는 함수로, 
이전에 설정된 타임아웃을 취소하는 역할을 합니다.
