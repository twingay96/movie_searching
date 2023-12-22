![image](https://github.com/twingay96/movie_searching/assets/64403357/33b58dde-69e2-4651-9cd0-fce1f13a50ed)![image](https://github.com/twingay96/movie_searching/assets/64403357/7cde6574-9182-439b-a4c5-a02357758fb2)


"_search_form.html.erb" :

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

controller.js에서 .request.submit()으로 인해 search_movies_path로 post요청:

![image](https://github.com/twingay96/movie_searching/assets/64403357/1eee1ee2-2212-4b0d-9e6d-f1cabcf3f84a)

Movie모델에 params["title_search"]로 데이터베이스에서 조회 하는 메소드를 정의:


![image](https://github.com/twingay96/movie_searching/assets/64403357/88c7929a-5c35-4490-94e5-e70688d4de5f)

"scope :filter_by_title"는 특정 데이터베이스 쿼리를 캡슐화하기 위한 방법으로 사용됩니다.
빨간색 밑줄이 그어진 부분은 where 절 내에 있는 SQL 쿼리입니다. 
이 쿼리는 인수로 전달된 title컬럼에 대하여 주어진 title변수( 정확히는 params[:title_search] )를 포함하는 모든 레코드를 검색합니다. 
% 기호는 와일드카드로서, 문자열의 어떤 부분과도 일치할 수 있습니다. 
이렇게 LIKE 연산자를 사용하면 부분 일치 검색을 수행할 수 있습니다.

"title LIKE ?"는 플레이스홀더를 사용한 안전한 쿼리 방식으로, SQL 인젝션 공격을 방지할 수 있습니다. "#{"%#{title}%"} 부분은 문자열 보간을 통해 title 변수에 들어 있는 값에 %를 앞뒤로 추가하여, 어떤 문자든 title 변수 값 앞이나 뒤에 있을 수 있음을 나타냅니다.

이때 스코프를 사용하는 이유는 :

    1.	재사용성: 한 번 정의한 스코프는 모델의 다른 부분에서도 재사용할 수 있으므로 코드 중복을 줄일 수 있습니다.
    	2.	체이닝: 스코프는 쿼리 메소드를 체인으로 연결할 수 있게 해주어, 복잡한 쿼리를 보다 쉽게 구성할 수 있습니다.
    	3.	유지보수: 스코프를 사용하면 쿼리 로직을 모델에 집중시켜 컨트롤러를 간결하게 유지할 수 있으며, 나중에 쿼리를 수정해야 할 때 한 곳에서만 수정하면 됩니다.
    	4.	읽기 쉬움: 스코프는 명시적인 이름을 가짐으로써 코드의 가독성을 높여주고, 의도를 명확하게 표현합니다.

search컨트롤러에서 Movie.where(...) 직접 사용 대신에 filter_by_title 같은 스코프를 정의함으로써, 해당 쿼리를 실행하는 코드가 무엇을 하는지 한눈에 알아볼 수 있게 해주며, 다른 개발자들이 코드를 이해하고 확장하는 데 도움을 줍니다.

![image](https://github.com/twingay96/movie_searching/assets/64403357/f7e75107-40f7-49f2-9687-f146b641f31f)

search액션에서 응답으로 turbo_stream을 사용하여 index템플릿의 
"search_results"요소의 내부를 "search_results.html.erb"로 update 




