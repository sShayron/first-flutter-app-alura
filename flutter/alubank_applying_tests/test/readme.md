# To generate mocks
use the annotation 
@GenerateMocks([BankHttp])
then run the command:
dart run build_runner build
the command will look only the folder /test and then generate the mocks for the classes given in the annotation