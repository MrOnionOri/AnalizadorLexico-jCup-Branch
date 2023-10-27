package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}
( "\n" ) {return Linea;}
/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.IDENTIFICADOR, yychar, yyline, yytext());}


\+ { return new Symbol(sym.MAS, yychar, yyline, yytext()); }
\- { return new Symbol(sym.MENOS, yychar, yyline, yytext()); }
\* { return new Symbol(sym.POR, yychar, yyline, yytext()); }
\/ { return new Symbol(sym.DIV, yychar, yyline, yytext()); }
\% { return new Symbol(sym.MOD, yychar, yyline, yytext()); }
\+\+ { return new Symbol(sym.INCREMENTO, yychar, yyline, yytext()); }
\-\- { return new Symbol(sym.DECREMENTO, yychar, yyline, yytext()); }
\+\= { return new Symbol(sym.MASIGUAL, yychar, yyline, yytext()); }
\-\= { return new Symbol(sym.MENOSIGUAL, yychar, yyline, yytext()); }
\*\= { return new Symbol(sym.PORIGUAL, yychar, yyline, yytext()); }
\/\= { return new Symbol(sym.DIVIGUAL, yychar, yyline, yytext()); }
\%\= { return new Symbol(sym.MODIGUAL, yychar, yyline, yytext()); }
//Functions



Split {return new Symbol(sym.SPLIT, yychar, yyline, yytext());}
Replace {return new Symbol(sym.REPLACE, yychar, yyline, yytext());}
Substring {return new Symbol(sym.SUBSTRING, yychar, yyline, yytext());}
IndexOf {return new Symbol(sym.INDEXOF, yychar, yyline, yytext());}
LastIndexOf  {return new Symbol(sym.LASTINDEXOF, yychar, yyline, yytext());}
Contains {return new Symbol(sym.CONTAINS, yychar, yyline, yytext());}
StartsWith {return new Symbol(sym.STARTSWITH, yychar, yyline, yytext());}
EndsWith {return new Symbol(sym.ENDSWITH, yychar, yyline, yytext());}
Trim {return new Symbol(sym.TRIM, yychar, yyline, yytext());}

//File Stream


File {return new Symbol(sym.FILE, yychar, yyline, yytext());}
FileMode {return new Symbol(sym.FILEMODE, yychar, yyline, yytext());}
FileAccess {return new Symbol(sym.FILEACCESS, yychar, yyline, yytext());}
FileShare {return new Symbol(sym.FILESHARE, yychar, yyline, yytext());}
FileOptions {return new Symbol(sym.FILEOPTIONS, yychar, yyline, yytext());}
FileAttributes {return new Symbol(sym.FILEATTRIBUTES, yychar, yyline, yytext());}

//VAR_PARSER

Single {return new Symbol(sym.VAR_PARSE_SINGLE, yychar, yyline, yytext());}
Double {return new Symbol(sym.VAR_PARSE_DOUBLE), yychar, yyline, yytext();}
Int {return new Symbol(sym.VAR_PARSE_INT), yychar, yyline, yytext();}
Int16 {return new Symbol(sym.VAR_PARSE_INT16), yychar, yyline, yytext();}
Int32 {return new Symbol(sym.VAR_PARSE_INT32), yychar, yyline, yytext();}
Int64 {return new Symbol(sym.VAR_PARSE_INT64), yychar, yyline, yytext();}
UInt {return new Symbol(sym.VAR_PARSE_UINT), yychar, yyline, yytext();}
UInt16 {return new Symbol(sym.VAR_PARSE_UINT16), yychar, yyline, yytext();}
UInt32 {return new Symbol(sym.VAR_PARSE_UINT32), yychar, yyline, yytext();}
UInt64 {return new Symbol(sym.VAR_PARSE_UINT64), yychar, yyline, yytext();}
Decima {return new Symbol(sym.VAR_PARSE_DECIMAL), yychar, yyline, yytext();}
Boolea {return new Symbol(sym.VAR_PARSE_BOOLEAN), yychar, yyline, yytext();}
Char {return new Symbol(sym.VAR_PARSE_CHAR), yychar, yyline, yytext();}
String {return new Symbol(sym.VAR_PARSE_STRING), yychar, yyline, yytext();}
Byte {return new Symbol(sym.VAR_PARSE_BYTE), yychar, yyline, yytext();}
SByte {return new Symbol(sym.VAR_PARSE_SBYTE), yychar, yyline, yytext();}
Object {return new Symbol(sym.VAR_PARSE_OBJECT), yychar, yyline, yytext();}
Float {return new Symbol(sym.VAR_PARSE_FLOAT), yychar, yyline, yytext();}




//Tipos de datos
lambda {return new Symbol(sym.LAMBDA), yychar, yyline, yytext();}
bool {return new Symbol(sym.BOOL), yychar, yyline, yytext();}
byte {return new Symbol(sym.BYTE), yychar, yyline, yytext();}
char {return new Symbol(sym.CHAR), yychar, yyline, yytext();}
decimal {return new Symbol(sym.DECIMAL), yychar, yyline, yytext();}
double {return new Symbol(sym.DOUBLE), yychar, yyline, yytext();}
float {return new Symbol(sym.FLOAT), yychar, yyline, yytext();}
int {return new Symbol(sym.INT), yychar, yyline, yytext();}
long {return new Symbol(sym.LONG), yychar, yyline, yytext();}
object {return new Symbol(sym.OBJECT), yychar, yyline, yytext();}
sbyte {return new Symbol(sym.SBYTE), yychar, yyline, yytext();}
short {return new Symbol(sym.SHORT), yychar, yyline, yytext();}
string {return new Symbol(sym.STRING), yychar, yyline, yytext();}
uint {return new Symbol(sym.UINT), yychar, yyline, yytext();}
ulong {return new Symbol(sym.ULONG), yychar, yyline, yytext();}
ushort {return new Symbol(sym.USHORT), yychar, yyline, yytext();}
let {return new Symbol(sym.LET), yychar, yyline, yytext();}


//Proteccion de datos
public        {return new Symbol(sym.PUBLIC), yychar, yyline, yytext();}
private       {return new Symbol(sym.PRIVATE), yychar, yyline, yytext();}
protected {return new Symbol(sym.PROTECTED), yychar, yyline, yytext();}
internal      {return new Symbol(sym.INTERNAL), yychar, yyline, yytext();}
static        {return new Symbol(sym.STATIC), yychar, yyline, yytext();}
virtual       {return new Symbol(sym.VIRTUAL), yychar, yyline, yytext();}
sealed        {return new Symbol(sym.SEALED), yychar, yyline, yytext();}
override      {return new Symbol(sym.OVERRIDE), yychar, yyline, yytext();}
abstract      {return new Symbol(sym.ABSTRACT), yychar, yyline, yytext();}
readonly      {return new Symbol(sym.READONLY), yychar, yyline, yytext();}
void          {return new Symbol(sym.VOID), yychar, yyline, yytext();}
local         {return new Symbol(sym.LOCAL), yychar, yyline, yytext();}



//Evaluadores de datos o Palabras reservadas
if {return new Symbol(sym.IF, yychar, yyline, yytext());}
else {return new Symbol(sym.ELSE, yychar, yyline, yytext());}
switch {return new Symbol(sym.SWITCH, yychar, yyline, yytext());}
case {return new Symbol(sym.CASE, yychar, yyline, yytext());}
default {return new Symbol(sym.DEFAULT, yychar, yyline, yytext());}
typedef {return new Symbol(sym.TYPEDEF, yychar, yyline, yytext());}
union {return new Symbol(sym.UNION, yychar, yyline, yytext());}
auto {return new Symbol(sym.AUTO, yychar, yyline, yytext());}
register {return new Symbol(sym.REGISTER, yychar, yyline, yytext());}
extern {return new Symbol(sym.EXTERN, yychar, yyline, yytext());}
const {return new Symbol(sym.CONST, yychar, yyline, yytext());}
volatile {return new Symbol(sym.VOLATILE, yychar, yyline, yytext());}

print {return new Symbol(sym.PRINT, yychar, yyline, yytext());}

//import 
import {return new Symbol(sym.IMPORT, yychar, yyline, yytext());}

//Llamada de funciones
CALL {return new Symbol(sym.CALL, yychar, yyline, yytext());}
CALLBACK {return new Symbol(sym.CALLBACK, yychar, yyline, yytext());}

//Ciclos de datos
while {return new Symbol(sym.WHILE, yychar, yyline, yytext());}
do {return new Symbol(sym.DO, yychar, yyline, yytext());}
for {return new Symbol(sym.FOR, yychar, yyline, yytext());}
foreach {return new Symbol(sym.FOREACH, yychar, yyline, yytext());}

//Booleanos
true {return new Symbol(sym.TRUE, yychar, yyline, yytext());}
false {return new Symbol(sym.FALSE, yychar, yyline, yytext());}

//Funciones de datos
in {return new Symbol(sym.IN, yychar, yyline, yytext());}
break {return new Symbol(sym.BREAK, yychar, yyline, yytext());}
continue {return new Symbol(sym.CONTINUE, yychar, yyline, yytext());} 
goto {return new Symbol(sym.GOTO, yychar, yyline, yytext());}
return {return new Symbol(sym.RETURN, yychar, yyline, yytext());}
pass {return new Symbol(sym.PASS, yychar, yyline, yytext());}

//Detector de errores
try {return new Symbol(sym.TRY, yychar, yyline, yytext());}
catch {return new Symbol(sym.CATCH, yychar, yyline, yytext());}
finally {return new Symbol(sym.FINALLY, yychar, yyline, yytext());}
throw {return new Symbol(sym.THROW, yychar, yyline, yytext());}

_if_not_exists {return new Symbol(sym.IF_NOT_EXISTS, yychar, yyline, yytext());}
_fastcall {return new Symbol(sym.FASTCALL, yychar, yyline, yytext());}

//Directrices de instancias de datos y estructuras de datos
using {return new Symbol(sym.USING, yychar, yyline, yytext());}
namespace {return new Symbol(sym.NAMESPACE, yychar, yyline, yytext());}
class {return new Symbol(sym.CLASS, yychar, yyline, yytext());}
struct {return new Symbol(sym.STRUCT, yychar, yyline, yytext());}
enum {return new Symbol(sym.ENUM, yychar, yyline, yytext());}
interface {return new Symbol(sym.INTERFACE, yychar, yyline, yytext());}
delegate {return new Symbol(sym.DELEGATE, yychar, yyline, yytext());}
event {return new Symbol(sym.EVENT, yychar, yyline, yytext());}
operator {return new Symbol(sym.OPERATOR, yychar, yyline, yytext());}
sizeof {return new Symbol(sym.SIZEOF, yychar, yyline, yytext());}
typeof {return new Symbol(sym.TYPEOF, yychar, yyline, yytext());}
new {return new Symbol(sym.NEW, yychar, yyline, yytext());}
this {return new Symbol(sym.THIS, yychar, yyline, yytext());}
base {return new Symbol(sym.BASE, yychar, yyline, yytext());}
__asm {return new Symbol(sym.ASM, yychar, yyline, yytext());}
_as {return new Symbol(sym.AS, yychar, yyline, yytext());}
__try_cast {return new Symbol(sym.TRY_CAST, yychar, yyline, yytext());}
reinterpret_cast {return new Symbol(sym.REINTERPRET_CAST, yychar, yyline, yytext());} 
dllimport {return new Symbol(sym.DLLIMPORT, yychar, yyline, yytext());}
dllexport {return new Symbol(sym.DLLEXPORT, yychar, yyline, yytext());}
dynamic_cast {return new Symbol(sym.DYNAMIC_CAST, yychar, yyline, yytext());}
instanceof {return new Symbol(sym.INSTANCEOF, yychar, yyline, yytext());}

//Funciones asyncronas
async {return new Symbol(sym.ASYNC, yychar, yyline, yytext());}
await {return new Symbol(sym.AWAIT, yychar, yyline, yytext());}
//Directivas c:
#region {return new Symbol(sym._REGION, yychar, yyline, yytext());}
_region {return new Symbol(sym.REGION, yychar, yyline, yytext());}
#endregio {return new Symbol(sym._ENDREGION, yychar, yyline, yytext());}
_endregio {return new Symbol(sym.ENDREGION, yychar, yyline, yytext());}
#pragma {return new Symbol(sym._PRAGMA, yychar, yyline, yytext());}
_pragma {return new Symbol(sym.PRAGMA, yychar, yyline, yytext());}
#line {return new Symbol(sym._LINE, yychar, yyline, yytext());}
_line {return new Symbol(sym.LINE, yychar, yyline, yytext());}
#column {return new Symbol(sym._COLUMN, yychar, yyline, yytext());} 
_column {return new Symbol(sym.COLUMN, yychar, yyline, yytext());}
#file {return new Symbol(sym._FILE, yychar, yyline, yytext());}
_file {return new Symbol(sym.FILE, yychar, yyline, yytext());} 
#function {return new Symbol(sym._FUNCTION, yychar, yyline, yytext());} 
_function {return new Symbol(sym.FUNCTION, yychar, yyline, yytext());}
#date {return new Symbol(sym._DATE, yychar, yyline, yytext());}
_date {return new Symbol(sym.DATE, yychar, yyline, yytext());}
#time {return new Symbol(sym._TIME, yychar, yyline, yytext());}
_time {return new Symbol(sym.TIME, yychar, yyline, yytext());}
#datetime {return new Symbol(sym._DATETIME, yychar, yyline, yytext());}
_datetime {return new Symbol(sym.DATETIME, yychar, yyline, yytext());}
#uuid {return new Symbol(sym._UUID, yychar, yyline, yytext());}
_uuid {return new Symbol(sym.UUID, yychar, yyline, yytext());}
#arglist {return new Symbol(sym._ARGLIST, yychar, yyline, yytext());}
_arglist {return new Symbol(sym.ARGLIST, yychar, yyline, yytext());}
#makeref {return new Symbol(sym._MAKEREF, yychar, yyline, yytext());}
_makeref {return new Symbol(sym.MAKEREF, yychar, yyline, yytext());}
#reftype {return new Symbol(sym._REFTYPE, yychar, yyline, yytext());}
_reftype {return new Symbol(sym.REFTYPE, yychar, yyline, yytext());}
#refvalue {return new Symbol(sym._REFVALUE, yychar, yyline, yytext());}
_refvalue {return new Symbol(sym.REFVALUE, yychar, yyline, yytext());}
#out {return new Symbol(sym._OUT, yychar, yyline, yytext());}
_out {return new Symbol(sym.OUT, yychar, yyline, yytext());}
#in {return new Symbol(sym._IN, yychar, yyline, yytext());}
_in {return new Symbol(sym.IN, yychar, yyline, yytext());}
#inout {return new Symbol(sym._INOUT, yychar, yyline, yytext());}
_inout {return new Symbol(sym.INOUT, yychar, yyline, yytext());}
#box {return new Symbol(sym._BOX, yychar, yyline, yytext());}
_box {return new Symbol(sym.BOX, yychar, yyline, yytext());}
#unbox {return new Symbol(sym._UNBOX, yychar, yyline, yytext());}
_unbox {return new Symbol(sym.UNBOX, yychar, yyline, yytext());}
#unboxany {return new Symbol(sym._UNBOXANY, yychar, yyline, yytext());} 
_unboxany {return new Symbol(sym.UNBOXANY, yychar, yyline, yytext());}
#is {return new Symbol(sym._IS, yychar, yyline, yytext());}
_is {return new Symbol(sym.IS, yychar, yyline, yytext());}
#define {return new Symbol(sym._DEFINE, yychar, yyline, yytext());}
_define {return new Symbol(sym.DEFINE, yychar, yyline, yytext());}
#undef {return new Symbol(sym._UNDEFINE, yychar, yyline, yytext());}
_undef {return new Symbol(sym.UNDEFINE, yychar, yyline, yytext());}
#ifdef {return new Symbol(sym._IFDEF, yychar, yyline, yytext());}
_ifdef {return new Symbol(sym.IFDEF, yychar, yyline, yytext());}
_ifnde {return new Symbol(sym.IFNDEF, yychar, yyline, yytext());}
_elif {return new Symbol(sym.ELIF, yychar, yyline, yytext());}
_else {return new Symbol(sym.ELSE, yychar, yyline, yytext());}
_endif {return new Symbol(sym.ENDIF, yychar, yyline, yytext());}
_line {return new Symbol(sym.LINE, yychar, yyline, yytext());}
_error {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
_pragma {return new Symbol(sym.PRAGMA, yychar, yyline, yytext());}
_warning {return new Symbol(sym.WARNING, yychar, yyline, yytext());}
_include {return new Symbol(sym.INCLUDE, yychar, yyline, yytext());}
_include_next {return new Symbol(sym.INCLUDE_NEXT, yychar, yyline, yytext());}
_has_include {return new Symbol(sym.HAS_INCLUDE, yychar, yyline, yytext());}
_has_include_next {return new Symbol(sym.HAS_INCLUDE_NEXT, yychar, yyline, yytext());}
_has_ocpp_attribute {return new Symbol(sym.HAS_OCPP_ATTRIBUTE, yychar, yyline, yytext());}
unsigned {return new Symbol(sym.UNSIGNED, yychar, yyline, yytext());}

//Arrays
//array|arraylist|list|dictionary|queue|stack|hashset|hashmap|hashlist|hashqueue|hashstack|hashdictionary {return new Symbol(sym.ARRAYS, yychar, yyline, yytext());}
Array {return new Symbol(sym.ARRAY, yychar, yyline, yytext());}
Arraylist {return new Symbol(sym.ARRAYLIST, yychar, yyline, yytext());}
List {return new Symbol(sym.LIST, yychar, yyline, yytext());}
Dictionary {return new Symbol(sym.DICTIONARY, yychar, yyline, yytext());}
Queue {return new Symbol(sym.QUEUE, yychar, yyline, yytext());}
Stack {return new Symbol(sym.STACK, yychar, yyline, yytext());}
Hashset {return new Symbol(sym.HASHSET, yychar, yyline, yytext());}
Hashmap {return new Symbol(sym.HASHMAP, yychar, yyline, yytext());}
Hashlist {return new Symbol(sym.HASHLIST, yychar, yyline, yytext());}
Hashqueue {return new Symbol(sym.HASHQUEUE, yychar, yyline, yytext());}
Hashstack {return new Symbol(sym.HASHSTACK, yychar, yyline, yytext());}
Hashdictionary {return new Symbol(sym.HASHDICTIONARY, yychar, yyline, yytext());}
byteArray {return new Symbol(sym.BYTEARRAY, yychar, yyline, yytext());}
sbyteArray {return new Symbol(sym.SBYTEARRAY, yychar, yyline, yytext());}
charArray {return new Symbol(sym.CHARARRAY, yychar, yyline, yytext());}
shortArray {return new Symbol(sym.SHORTARRAY, yychar, yyline, yytext());}
intArray {return new Symbol(sym.INTARRAY, yychar, yyline, yytext());}
longArray {return new Symbol(sym.LONGARRAY, yychar, yyline, yytext());}
floatArray {return new Symbol(sym.FLOATARRAY, yychar, yyline, yytext());}
doubleArray {return new Symbol(sym.DOUBLEARRAY, yychar, yyline, yytext());}
boolArray {return new Symbol(sym.BOOLARRAY, yychar, yyline, yytext());}
stringArray {return new Symbol(sym.STRINGARRAY, yychar, yyline, yytext());}
objectArray {return new Symbol(sym.OBJECTARRAY, yychar, yyline, yytext());}
uintArray {return new Symbol(sym.UINTARRAY, yychar, yyline, yytext());}
ulongArray {return new Symbol(sym.ULONGARRAY, yychar, yyline, yytext());}
ushortArray {return new Symbol(sym.USHORTARRAY, yychar, yyline, yytext());}
decimalArray {return new Symbol(sym.DECIMALARRAY, yychar, yyline, yytext());}
varArray {return new Symbol(sym.VARARRAY, yychar, yyline, yytext());}
int16Array {return new Symbol(sym.INT16ARRAY, yychar, yyline, yytext());}
int32Array {return new Symbol(sym.INT32ARRAY, yychar, yyline, yytext());}
int64Array {return new Symbol(sym.INT64ARRAY, yychar, yyline, yytext());}
uint16Array {return new Symbol(sym.UINT16ARRAY, yychar, yyline, yytext());}
uint32Array {return new Symbol(sym.UINT32ARRAY, yychar, yyline, yytext());}
uint64Array {return new Symbol(sym.UINT64ARRAY, yychar, yyline, yytext());}

//ARCHSystem

arch {return new Symbol(sym.ARCH, yychar, yyline, yytext());}
arch32 {return new Symbol(sym.ARCH32, yychar, yyline, yytext());}
arch64 {return new Symbol(sym.ARCH64, yychar, yyline, yytext());}
arch128 {return new Symbol(sym.ARCH128, yychar, yyline, yytext());}
archArm {return new Symbol(sym.ARCHARM, yychar, yyline, yytext());}
archArm32 {return new Symbol(sym.ARCHARM32, yychar, yyline, yytext());}
archArm64 {return new Symbol(sym.ARCHARM64, yychar, yyline, yytext());}
archM1 {return new Symbol(sym.ARCHM1, yychar, yyline, yytext());}
archM2 {return new Symbol(sym.ARCHM2, yychar, yyline, yytext());}


//Sistemas de encodificacion


ascii {return new Symbol(sym.ASCII, yychar, yyline, yytext());}
utf8 {return new Symbol(sym.UTF8, yychar, yyline, yytext());}
utf16 {return new Symbol(sym.UTF16, yychar, yyline, yytext());}
utf32 {return new Symbol(sym.UTF32, yychar, yyline, yytext());}
utf7 {return new Symbol(sym.UTF7, yychar, yyline, yytext());}
utf1 {return new Symbol(sym.UTF1, yychar, yyline, yytext());}


//Sistemas de encriptacion


aes {return new Symbol(sym.AES, yychar, yyline, yytext());}
aes128 {return new Symbol(sym.AES128, yychar, yyline, yytext());}
aes192 {return new Symbol(sym.AES192, yychar, yyline, yytext());}
aes256 {return new Symbol(sym.AES256, yychar, yyline, yytext());}
aes512 {return new Symbol(sym.AES512, yychar, yyline, yytext());}



//Retorno de datos
return {return new Symbol(sym.RETURN, yychar, yyline, yytext());}

//Threads
thread {return new Symbol(sym.THREAD, yychar, yyline, yytext());}
threadpool {return new Symbol(sym.THREADPOOL, yychar, yyline, yytext());}
threadstart {return new Symbol(sym.THREADSTART, yychar, yyline, yytext());}
threadabort {return new Symbol(sym.THREADABORT, yychar, yyline, yytext());}
threadabortexception {return new Symbol(sym.THREADABORTEXCEPTION, yychar, yyline, yytext());}
threadstate {return new Symbol(sym.THREADSTATE, yychar, yyline, yytext());}
threadpriority {return new Symbol(sym.THREADPRIORITY, yychar, yyline, yytext());}
threadprioritylevel {return new Symbol(sym.THREADPRIORITYLEVEL, yychar, yyline, yytext());}
threadexception {return new Symbol(sym.THREADEXCEPTION, yychar, yyline, yytext());}
threadexceptionhandler {return new Symbol(sym.THREADEXCEPTIONHANDLER, yychar, yyline, yytext());}
threadexceptionmode {return new Symbol(sym.THREADEXCEPTIONMODE, yychar, yyline, yytext());}
threadexceptionsource {return new Symbol(sym.THREADEXCEPTIONSOURCE, yychar, yyline, yytext());}

none {return new Symbol(sim.NONE, yychar, yyline, yytext());}
null {return new Symbol(sym.NULL, yychar, yyline, yytext());}

//asignacion de datos
\= {return new Symbol(sym.ASIGNACION, yychar, yyline, yytext());}
\=\> {return new Symbol(sym.ASIGNACION_EXPLICITA, yychar, yyline, yytext());}
\" {return new Symbol(sym.COMILLAS, yychar, yyline, yytext());}

// \= | \=\> {return new Symbol(sym.ASIGNACION, yychar, yyline, yytext());}
\-\> {return new Symbol(sym.FLECHA, yychar, yyline, yytext());}

//Separador de datos
\; {return new Symbol(sym.PUNTO_COMA, yychar, yyline, yytext());}
\, {return new Symbol(sym.COMA, yychar, yyline, yytext());}


//Operadores Logicos
\=\= {return new Symbol(sym.IGUAL_IGUAL, yychar, yyline, yytext());}
\!\= {return new Symbol(sym.DIFERENTE, yychar, yyline, yytext());}
\> {return new Symbol(sym.MAYOR, yychar, yyline, yytext());}
\< {return new Symbol(sym.MENOR, yychar, yyline, yytext());}
\>\= {return new Symbol(sym.MAYOR_IGUAL, yychar, yyline, yytext());}
\<\= {return new Symbol(sym.MENOR_IGUAL, yychar, yyline, yytext());}
\&\& {return new Symbol(sym.AND, yychar, yyline, yytext());}
\|\| {return new Symbol(sym.OR, yychar, yyline, yytext());}
\! {return new Symbol(sym.NOT, yychar, yyline, yytext());}
\!\! {return new Symbol(sym.NOT_NOT, yychar, yyline, yytext());}
\? {return new Symbol(sym.INTERROGACION, yychar, yyline, yytext());}
\: {return new Symbol(sym.DOS_PUNTOS, yychar, yyline, yytext());}
\# {return new Symbol(sym.NUMERAL, yychar, yyline, yytext());}
\@ {return new Symbol(sym.ARROBA, yychar, yyline, yytext());}
dump {return new Symbol(sym.DUMP, yychar, yyline, yytext());}

Kryptol {return new Symbol(sym.KRYPTOL), yychar, yyline, yytext();}
ZephyrScript {return new Symbol(sym.ZEPHYRSCRIPT), yychar, yyline, yytext();}
XyloCode {return new Symbol(sym.XYLOCODE), yychar, yyline, yytext();}
Quarky {return new Symbol(sym.QUARKY), yychar, yyline, yytext();}
SynthetiX {return new Symbol(sym.SYNTHETIX), yychar, yyline, yytext();}
Tesseract {return new Symbol(sym.TESSERACT), yychar, yyline, yytext();}
Nimbic {return new Symbol(sym.NIMBIC), yychar, yyline, yytext();}
Axiomate {return new Symbol(sym.AXIOMATE), yychar, yyline, yytext();}
JoltScript {return new Symbol(sym.JOLTSCRIPT), yychar, yyline, yytext();}
Nexu {return new Symbol(sym.NEXU), yychar, yyline, yytext();}
IntegroScri {return new Symbol(sym.INTEGROSCRIPT), yychar, yyline, yytext();}
NovaLisp {return new Symbol(sym.NOVALISP), yychar, yyline, yytext();}
ZenithCode  {return new Symbol(sym.ZENITHCODE), yychar, yyline, yytext();}
Osmosis {return new Symbol(sym.OSMOSIS), yychar, yyline, yytext();}
Envision {return new Symbol(sym.ENVISION), yychar, yyline, yytext();}
VelociScrip {return new Symbol(sym.VELOCISCRIPT), yychar, yyline, yytext();}
HelixLang {return new Symbol(sym.HELIXLANG), yychar, yyline, yytext();}
FusionX {return new Symbol(sym.FUSIONX), yychar, yyline, yytext();}
Omnicode {return new Symbol(sym.OMNICODE), yychar, yyline, yytext();}
VortexScript {return new Symbol(sym.VORTEXSCRIPT), yychar, yyline, yytext();}
Lumina {return new Symbol(sym.LUMINA), yychar, yyline, yytext();}
NebulaCode  {return new Symbol(sym.NEBULACODE), yychar, yyline, yytext();}
SynapseX {return new Symbol(sym.SYNAPSEX), yychar, yyline, yytext();}
QuartzScript {return new Symbol(sym.QUARTZSCRIPT), yychar, yyline, yytext();}
InfernoLang {return new Symbol(sym.INFERNO), yychar, yyline, yytext();}
SpectraScript {return new Symbol(sym.SPECTRASCRIPT), yychar, yyline, yytext();}
FluxLang {return new Symbol(sym.FLUXLANG), yychar, yyline, yytext();}
AurumScript {return new Symbol(sym.AURUMSCRIPT), yychar, yyline, yytext();}
ChromaLang {return new Symbol(sym.CHROMALANG), yychar, yyline, yytext();}
PolarisCode {return new Symbol(sym.POLARISCODE), yychar, yyline, yytext();}
CypherX {return new Symbol(sym.CYPHERX), yychar, yyline, yytext();}
AlgoMind {return new Symbol(sym.ALGOMIND), yychar, yyline, yytext();}
StrataCode {return new Symbol(sym.STRATACODE), yychar, yyline, yytext();}
QuantumLang {return new Symbol(sym.QUANTUMLANG), yychar, yyline, yytext();}
ExoScript {return new Symbol(sym.EXOSCRIPT), yychar, yyline, yytext();}


//Delimitadores
\( {return new Symbol(sym.PARENTESIS_IZQ, yychar, yyline, yytext());}
\) {return new Symbol(sym.PARENTESIS_DER, yychar, yyline, yytext());}
\[ {return new Symbol(sym.CORCHETE_IZQ, yychar, yyline, yytext());}
\] {return new Symbol(sym.CORCHETE_DER, yychar, yyline, yytext());}
\{ {return new Symbol(sym.LLAVE_IZQ, yychar, yyline, yytext());}
\} {return new Symbol(sym.LLAVE_DER, yychar, yyline, yytext());}
\.  {return new Symbol(sym.PUNTO, yychar, yyline, yytext());}
\;  {return new Symbol(sym.PUNTO_COMA, yychar, yyline, yytext());}
\:  {return new Symbol(sym.DOS_PUNTOS, yychar, yyline, yytext());}



/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.NUMERO, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
