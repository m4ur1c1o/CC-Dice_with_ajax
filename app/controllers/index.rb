get '/' do
	@roll = Roll.create
	# @dice = params[:value]
  erb :index
end


# QUE HACER?: Convierte esta ruta para que utilice Ajax y si la petición no es de Ajax de igual forma sirva. 
post '/rolls' do
	puts"entre a rolls"
	# Si el user nos pasa un valor, lo usamos y so no creamos uno. 
  value = params[:value] ? params[:value].to_i : nil
	# puts "Esto es value: #{value}"
	p value
  @roll = value ? Roll.create(value: value) : Roll.create
	puts "Esto es @roll: #{@roll.value}"
  @roll = params[:value] ? Roll.create({ value: params[:value].to_i }) : Roll.create
	puts "Esto es after @roll: #{@roll.value}"
  # erb :index  # TIP: Que esta haciendo esto y que debe hacer diferente. 
  
  if request.xhr?
  	erb :_die_roll, layout: false
  else
  	erb :index
  end
end
