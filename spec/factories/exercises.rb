FactoryBot.define do
  factory :exercise do
    title_en 'Biceps curl'
    title_es 'Curl de bíceps'
    instructions_en 'We take the bar, stick the elbows to the sides of our body and throw the elbows back and we must raise the weight and lower it slowly until reaching the arm completely.'
    instructions_es 'Tomamos la barra, pegamos los codos a los costados de nuestro cuerpo y tiramos los codos hacia atrás y debemos subir el peso y bajarlo lentamente hasta estirar el brazo completamente.'
    has_resting_time true
    has_time false
    has_repetitions true
    has_weight true
    has_speed false
  end
end
