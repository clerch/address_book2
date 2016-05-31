# Homepage (Root path)
get '/' do
  erb :index
end

get '/contacts' do 
  contacts = Contact.all.order(first_name: :asc)
end

delete '/contact-delete/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
end

post '/contact-add' do
  @new_contact = Contact.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    phone: params[:phone]
  )
  @new_contact.save
  #if @new_plant validates, save
  if @new_contact.save
      json  :contact => { new_contact:  @new_contact }
  else
    raise "A runtime error occured"
  end
end

post '/contact-update' do
  @contact = Contact.find_by(id: params[:contact_id])
  @contact.update(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    phone: params[:phone]
    )
  @contact.save
end
