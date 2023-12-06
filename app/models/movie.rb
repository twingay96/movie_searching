class Movie < ApplicationRecord
    validates :title ,presence: true, uniqueness: true
    scope :filter_by_title, -> (title) {where('title LIKE ?', "%#{title}%")}

'''
"%#{title}%"는 Ruby에서 문자열 내에 변수 값을 삽입하기 위한 문자열 보간(interpolation) 문법입니다. 
이 문법을 사용하면 문자열 안에 있는 #{} 부분이 변수의 값으로 대체됩니다.
%%는 SQL에서 사용되는 와일드카드 문자입니다. 
SQL의 LIKE 연산자와 함께 사용되며, 패턴 매칭을 위해 문자열을 검색할 때 특정 위치에 있는 문자 또는 문자열을 대체하는 데 사용됩니다.
'''
    
end
