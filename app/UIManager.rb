require 'digest'

class UIManager

  def show message
    puts message
  end

  # Menu sin sesion
  def initialMenu
    puts "Digite un numero correspondiente a lo que quiere hacer"
    puts "1. Registrarse"
    puts "2. Iniciar sesion"
    puts "3. Salir"

    number_or_nil (gets.chomp)
  end

  # Menu de sesion
  def sessionMenu
    puts "Digite un numero correspondiente a lo que quiere hacer"
    puts "1. Consultar saldo disponible"
    puts "2. Consultar saldo total"
    puts "3. Recargar"
    puts "4. Retirar"
    puts "5. Enviar"
    puts "6. Consultar transacciones"
    puts "7. Colchón"
    puts "8. Bolsillos"
    puts "9. Cerrar sesión"

    number_or_nil (gets.chomp)
  end

  # Menu del colchón
  def mattressMenu
    puts "Digite un numero correspondiente a lo que quiere hacer"
    puts "1. Consultar dinero en colchón"
    puts "2. Agregar dinero"
    puts "3. Sacar dinero del colchón"
    puts "4. Regresar"

    number_or_nil (gets.chomp)
  end

  # Menu del bolsillo
  def pocketMenu
    puts "Digite un numero correspondiente a lo que quiere hacer"
    puts "1. Ver bolsillos"
    puts "2. Crear bolsillo"
    puts "3. Eliminar bolsillo"
    puts "4. Agregar dinero a bolsillo"
    puts "5. Retirar dinero de bolsillo"
    puts "6. Enviar dinero desde bolsillo"
    puts "7. Regresar"

    number_or_nil (gets.chomp)
  end

  def getName
    puts "Ingrese nombre"
    name = gets.chomp
  end

  def getEmail
    puts "Ingrese email"
    email = gets.chomp
  end

  def getPassword
    puts "Ingrese contraseña"
    password = gets.chomp
    # El metodo de encriptacion no debe ir aca
    Digest::SHA2.hexdigest  password
  end

  def getRechargeValue
    puts "Cuánto desea recargar?"
    number_or_nil (gets.chomp)
  end

  def getWithdrawValue
    puts "Cuánto desea retirar?"
    number_or_nil (gets.chomp)
  end

  def getSendValue
    puts "Cuánto desea enviar?"
    number_or_nil (gets.chomp)
  end

  def getNumTransactions
    puts "Cuántas transacciones desea ver?"
    number_or_nil (gets.chomp)
  end

  def getPocket pockets
    for i in 1..pockets.length
      puts "#{i}. #{pockets[i-1].name}: #{pockets[i-1].balance}"
    end
    number_or_nil (gets.chomp)
  end

  def display transaction
    if transaction.transaction_type == "recarga"
      puts "#{transaction.created_at.to_s[0..9]}: Recarga de $#{transaction.amount}"
    elsif transaction.transaction_type == "retiro"
      puts "#{transaction.created_at.to_s[0..9]}: Retiro de $#{transaction.amount}"
    elsif transaction.transaction_type == "envio"
      puts "#{transaction.created_at.to_s[0..9]}: Para #{transaction.user_name} $#{transaction.amount}"
    elsif transaction.transaction_type == "recepcion"
      puts "#{transaction.created_at.to_s[0..9]}: De #{transaction.user_name} $#{transaction.amount}"
    else
      puts "Error al mostrar transacciones"
    end
  end

  # Mensajes de error
  def errorMessageIncorrectInput
    puts "Entrada incorrecta"
  end

  # Validaciones
  def number_or_nil (string)
    Integer(string || '')
  rescue ArgumentError
    nil
  end

end
