package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
nl = \n|\r|\r\n 
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */

/* Espacios en blanco */
{nl} | " " {/*Ignore*/}
, {lexeme=yytext(); return COMA;}


/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

("main") {lexeme=yytext(); return MAIN;}



//Functions



\+ {lexeme=yytext(); return MAS;}
\- {lexeme=yytext(); return MENOS;}
\* {lexeme=yytext(); return POR;}
\/ {lexeme=yytext(); return DIVISION;}
\% {lexeme=yytext(); return MODULO;}
\+\+ {lexeme=yytext(); return MASMAS;}
\-\- {lexeme=yytext(); return MENOSMENOS;}
\+\= {lexeme=yytext(); return MASIGUAL;}
\-\= {lexeme=yytext(); return MENOSIGUAL;}
\*\= {lexeme=yytext(); return PORIGUAL;}
\/\= {lexeme=yytext(); return DIVISIONIGUAL;}
\%\= {lexeme=yytext(); return MODIGUAL;}


//Functions

Split {lexeme=yytext(); return SPLIT;}
Replace {lexeme=yytext(); return REPLACE;}
Substring {lexeme=yytext(); return SUBSTRING;}
IndexOf {lexeme=yytext(); return INDEXOF;}
LastIndexOf {lexeme=yytext(); return LASTINDEXOF;}
Contains {lexeme=yytext(); return CONTAINS;}
StartsWith {lexeme=yytext(); return STARTSWITH;}
EndsWith {lexeme=yytext(); return ENDSWITH;}
Trim {lexeme=yytext(); return TRIM;}

//File Stream

File {lexeme=yytext(); return FILE;}
FileMode {lexeme=yytext(); return FILEMODE;}
FileAccess {lexeme=yytext(); return FILEACCESS;}
FileShare {lexeme=yytext(); return FILESHARE;}
FileOptions {lexeme=yytext(); return FILEOPTIONS;}
FileAttributes {lexeme=yytext(); return FILEATTRIBUTES;}

//VAR_PARSER
Single {lexeme=yytext(); return VAR_PARSE_SINGLE;}
Double {lexeme=yytext(); return VAR_PARSE_DOUBLE;}
Int {lexeme=yytext(); return VAR_PARSE_INT;}
Int16 {lexeme=yytext(); return VAR_PARSE_INT16;}
Int32 {lexeme=yytext(); return VAR_PARSE_INT32;}
Int64 {lexeme=yytext(); return VAR_PARSE_INT64;}
UInt {lexeme=yytext(); return VAR_PARSE_UINT;}
UInt16 {lexeme=yytext(); return VAR_PARSE_UINT16;}
UInt32 {lexeme=yytext(); return VAR_PARSE_UINT32;}
UInt64 {lexeme=yytext(); return VAR_PARSE_UINT64;}
Decimal {lexeme=yytext(); return VAR_PARSE_DECIMAL;}
Boolean {lexeme=yytext(); return VAR_PARSE_BOOLEAN;}
Char {lexeme=yytext(); return VAR_PARSE_CHAR;}
String {lexeme=yytext(); return VAR_PARSE_STRING;}
Byte {lexeme=yytext(); return VAR_PARSE_BYTE;}
SByte {lexeme=yytext(); return VAR_PARSE_SBYTE;}
Object {lexeme=yytext(); return VAR_PARSE_OBJECT;}
Float {lexeme=yytext(); return VAR_PARSE_FLOAT;}


//Tipos de datos

lambda {lexeme=yytext(); return LAMBDA;}
bool {lexeme=yytext(); return BOOL;}
byte {lexeme=yytext(); return BYTE;}
char {lexeme=yytext(); return CHAR;}
decimal {lexeme=yytext(); return DECIMAL;}
double {lexeme=yytext(); return DOUBLE;}
float {lexeme=yytext(); return FLOAT;}
int {lexeme=yytext(); return INT;}
long {lexeme=yytext(); return LONG;}
object {lexeme=yytext(); return OBJECT;}
sbyte {lexeme=yytext(); return SBYTE;}
short {lexeme=yytext(); return SHORT;}
string {lexeme=yytext(); return STRING;}
uint {lexeme=yytext(); return UINT;}
ulong {lexeme=yytext(); return ULONG;}
ushort {lexeme=yytext(); return USHORT;}
let {lexeme=yytext(); return LET;}

//Proteccion de datos
public {lexeme=yytext(); return PUBLIC;}
private {lexeme=yytext(); return PRIVATE;}
protected {lexeme=yytext(); return PROTECTED;}
internal {lexeme=yytext(); return INTERNAL;}
static {lexeme=yytext(); return STATIC;}
virtual {lexeme=yytext(); return VIRTUAL;}
sealed {lexeme=yytext(); return SEALED;}
override {lexeme=yytext(); return OVERRIDE;}
abstract {lexeme=yytext(); return ABSTRACT;}
readonly {lexeme=yytext(); return READONLY;}
void {lexeme=yytext(); return VOID;}
local {lexeme=yytext(); return LOCAL;}


call {lexeme=yytext(); return CALL;}
callback {lexeme=yytext(); return CALLBACK;}

//Evaluadores de datos o Palabras reservadas
if {lexeme=yytext(); return IF;}
else {lexeme=yytext(); return ELSE;}
switch {lexeme=yytext(); return SWITCH;}
case {lexeme=yytext(); return CASE;}
default {lexeme=yytext(); return DEFAULT;}
typedef {lexeme=yytext(); return TYPEDEF;}
union {lexeme=yytext(); return UNION;}
auto {lexeme=yytext(); return AUTO;}
register {lexeme=yytext(); return REGISTER;}
extern {lexeme=yytext(); return EXTERN;}
const {lexeme=yytext(); return CONST;}
volatile {lexeme=yytext(); return VOLATILE;}

print {lexeme=yytext(); return PRINT;}

import {lexeme=yytext(); return IMPORT;}
//Ciclos de datos


while {lexeme=yytext(); return WHILE;}
do {lexeme=yytext(); return DO;}
for {lexeme=yytext(); return FOR;}
foreach {lexeme=yytext(); return FOREACH;}

//Booleanos
true {lexeme=yytext(); return TRUE;}
false {lexeme=yytext(); return FALSE;}


in {lexeme=yytext(); return IN;}
break {lexeme=yytext(); return BREAK;}
continue {lexeme=yytext(); return CONTINUE;}
goto {lexeme=yytext(); return GOTO;}
return {lexeme=yytext(); return RETURN;}
pass {lexeme=yytext(); return PASS;}

//Detector de errores
try {lexeme=yytext(); return TRY;}
catch {lexeme=yytext(); return CATCH;}
finally {lexeme=yytext(); return FINALLY;}
throw {lexeme=yytext(); return THROW;}

_if_not_exists {lexeme=yytext(); return IF_NOT_EXISTS;}
_fastcall {lexeme=yytext(); return FASTCALL;}

//Directrices de instancias de datos y estructuras de datos
using {lexeme=yytext(); return USING;}
namespace {lexeme=yytext(); return NAMESPACE;}
class {lexeme=yytext(); return CLASS;}
struct {lexeme=yytext(); return STRUCT;}
enum {lexeme=yytext(); return ENUM;}
interface {lexeme=yytext(); return INTERFACE;}
delegate {lexeme=yytext(); return DELEGATE;}
event {lexeme=yytext(); return EVENT;}
operator {lexeme=yytext(); return OPERATOR;}
sizeof {lexeme=yytext(); return SIZEOF;}
typeof {lexeme=yytext(); return TYPEOF;}
new {lexeme=yytext(); return NEW;}
this {lexeme=yytext(); return THIS;}
base {lexeme=yytext(); return BASE;}
__asm {lexeme=yytext(); return ASM;}
_as {lexeme=yytext(); return _AS;}
__try_cast {lexeme=yytext(); return TRY_CAST;}
reinterpret_cast {lexeme=yytext(); return REINTERPRET_CAST;}
dllimport {lexeme=yytext(); return DLLIMPORT;}
dllexport {lexeme=yytext(); return DLLEXPORT;}
dynamic_cast {lexeme=yytext(); return DYNAMIC_CAST;}
instanceof {lexeme=yytext(); return INSTANCEOF;}

//Funciones asyncronas
async {lexeme=yytext(); return ASYNC;}
await {lexeme=yytext(); return AWAIT;}
//Directivas
\#region {lexeme=yytext(); return REGION;}
_region {lexeme=yytext(); return _REGION;}
\#endregion {lexeme=yytext(); return ENDREGION;}
_endregion {lexeme=yytext(); return _ENDREGION;}
\#pragma {lexeme=yytext(); return PRAGMA;}
_pragma {lexeme=yytext(); return _PRAGMA;}
\#line {lexeme=yytext(); return LINE;}
_line {lexeme=yytext(); return _LINE;}
\#column {lexeme=yytext(); return COLUMN;}
_column {lexeme=yytext(); return _COLUMN;}
\#file {lexeme=yytext(); return FILE;}
_file {lexeme=yytext(); return _FILE;}
\#function {lexeme=yytext(); return FUNCTION;}
_function {lexeme=yytext(); return _FUNCTION;}
\#date {lexeme=yytext(); return DATE;}
_date {lexeme=yytext(); return _DATE;}
\#time {lexeme=yytext(); return TIME;}
_time {lexeme=yytext(); return _TIME;}
\#datetime {lexeme=yytext(); return DATETIME;}
_datetime {lexeme=yytext(); return _DATETIME;}
\#uuid {lexeme=yytext(); return UUID;}
_uuid {lexeme=yytext(); return _UUID;}
\#arglist {lexeme=yytext(); return ARGLIST;}
_arglist {lexeme=yytext(); return _ARGLIST;}
\#makeref {lexeme=yytext(); return MAKEREF;}
_makeref {lexeme=yytext(); return _MAKEREF;}
\#reftype {lexeme=yytext(); return REFTYPE;}
_reftype {lexeme=yytext(); return _REFTYPE;}
\#refvalue {lexeme=yytext(); return REFVALUE;}
_refvalue {lexeme=yytext(); return _REFVALUE;}
\#out {lexeme=yytext(); return OUT;}
_out {lexeme=yytext(); return _OUT;}
\#in {lexeme=yytext(); return INPR;}
_in {lexeme=yytext(); return _INPR;}
\#inout {lexeme=yytext(); return INOUT;}
_inout {lexeme=yytext(); return _INOUT;}
\#box {lexeme=yytext(); return BOX;}
_box {lexeme=yytext(); return _BOX;}
\#unbox {lexeme=yytext(); return UNBOX;}
_unbox {lexeme=yytext(); return _UNBOX;}
\#unboxany {lexeme=yytext(); return UNBOXANY;}
_unboxany {lexeme=yytext(); return _UNBOXANY;}
\#is {lexeme=yytext(); return IS;}
_is {lexeme=yytext(); return _IS;}
\#define {lexeme=yytext(); return DEFINE;}
_define {lexeme=yytext(); return _DEFINE;}
\#undef {lexeme=yytext(); return UNDEF;}
_undef {lexeme=yytext(); return _UNDEF;}
_if {lexeme=yytext(); return _IF;}
_ifdef {lexeme=yytext(); return _IFDEF;}
_ifndef {lexeme=yytext(); return _IFNDEF;}
_elif {lexeme=yytext(); return _ELIF;}
_else {lexeme=yytext(); return _ELSE;}
_endif {lexeme=yytext(); return _ENDIF;}
_line {lexeme=yytext(); return _LINE;}
_error {lexeme=yytext(); return _ERROR;}
_pragma {lexeme=yytext(); return _PRAGMA;}
_warning {lexeme=yytext(); return _WARNING;}
_include {lexeme=yytext(); return _INCLUDE;}
_include_next {lexeme=yytext(); return _INCLUDE_NEXT;}
_has_include {lexeme=yytext(); return _HAS_INCLUDE;}
_has_include_next {lexeme=yytext(); return _HAS_INCLUDE_NEXT;}
_has_ocpp_attribute {lexeme=yytext(); return _HAS_OCPP_ATTRIBUTE;}
unsigned {lexeme=yytext(); return UNSIGNED;}

//Arrays
Array {lexeme=yytext(); return ARRAY;}
Arraylist {lexeme=yytext(); return ARRAYLIST;}
List {lexeme=yytext(); return LIST;}
Dictionary {lexeme=yytext(); return DICTIONARY;}
Queue {lexeme=yytext(); return QUEUE;}
Stack {lexeme=yytext(); return STACK;}
Hashset {lexeme=yytext(); return HASHSET;}
Hashmap {lexeme=yytext(); return HASHMAP;}
Hashlist {lexeme=yytext(); return HASHLIST;}
Hashqueue {lexeme=yytext(); return HASHQUEUE;}
Hashstack {lexeme=yytext(); return HASHSTACK;}
ByteArray {lexeme=yytext(); return BYTEARRAY;}
SbyteArray {lexeme=yytext(); return SBYTEARRAY;}
CharArray {lexeme=yytext(); return CHARARRAY;}
ShortArray {lexeme=yytext(); return SHORTARRAY;}
IntArray {lexeme=yytext(); return INTARRAY;}
LongArray {lexeme=yytext(); return LONGARRAY;}
FloatArray {lexeme=yytext(); return FLOATARRAY;}
DoubleArray {lexeme=yytext(); return DOUBLEARRAY;}
BoolArray {lexeme=yytext(); return BOOLARRAY;}
StringArray {lexeme=yytext(); return STRINGARRAY;}
ObjectArray {lexeme=yytext(); return OBJECTARRAY;}
UintArray {lexeme=yytext(); return UINTARRAY;}
UlongArray {lexeme=yytext(); return ULONGARRAY;}
UshortArray {lexeme=yytext(); return USHORTARRAY;}
DecimalArray {lexeme=yytext(); return DECIMALARRAY;}
VarArray {lexeme=yytext(); return VARARRAY;}
Int16Array {lexeme=yytext(); return INT16ARRAY;}
Int32Array {lexeme=yytext(); return INT32ARRAY;}
Int64Array {lexeme=yytext(); return INT64ARRAY;}
Uint16Array {lexeme=yytext(); return UINT16ARRAY;}
Uint32Array {lexeme=yytext(); return UINT32ARRAY;}
Uint64Array {lexeme=yytext(); return UINT64ARRAY;}

//ARCHSystem


arch {lexeme=yytext(); return ARCH;}
arch32 {lexeme=yytext(); return ARCH32;}
arch64 {lexeme=yytext(); return ARCH64;}
arch128 {lexeme=yytext(); return ARCH128;}
archArm {lexeme=yytext(); return ARCHARM;}
archArm32 {lexeme=yytext(); return ARCHARM32;}
archArm64 {lexeme=yytext(); return ARCHARM64;}
archM1 {lexeme=yytext(); return ARCHM1;}
archM2 {lexeme=yytext(); return ARCHM2;}

//Sistemas de encodificacion



ascii {lexeme=yytext(); return ASCII;}
utf8 {lexeme=yytext(); return UTF8;}
utf16 {lexeme=yytext(); return UTF16;}
utf32 {lexeme=yytext(); return UTF32;}
utf7 {lexeme=yytext(); return UTF7;}
utf1 {lexeme=yytext(); return UTF1;}

//Sistemas de encriptacion

aes {lexeme=yytext(); return AES;}
aes128 {lexeme=yytext(); return AES128;}
aes192 {lexeme=yytext(); return AES192;}
aes256 {lexeme=yytext(); return AES256;}
aes512 {lexeme=yytext(); return AES512;}


//Retorno de datos
return {lexeme=yytext(); return RETURN;}

//Threads
thread {lexeme=yytext(); return THREAD;}
threadpool {lexeme=yytext(); return THREADPOOL;}
threadstart {lexeme=yytext(); return THREADSTART;}
threadabort {lexeme=yytext(); return THREADABORT;}
threadabortexception {lexeme=yytext(); return THREADABORTEXCEPTION;}
threadstate {lexeme=yytext(); return THREADSTATE;}
threadpriority {lexeme=yytext(); return THREADPRIORITY;}
threadprioritylevel {lexeme=yytext(); return THREADPRIORITYLEVEL;}
threadexception {lexeme=yytext(); return THREADEXCEPTION;}
threadexceptionhandler {lexeme=yytext(); return THREADEXCEPTIONHANDLER;}
threadexceptionmode {lexeme=yytext(); return THREADEXCEPTIONMODE;}
threadexceptionsource {lexeme=yytext(); return THREADEXCEPTIONSOURCE;}

null {lexeme=yytext(); return NULL;}
none {lexeme=yytext(); return NONE;}

\" {lexeme=yytext() ;return COMILLAS;}
\= {lexeme=yytext(); return IGUAL;}
\=\> {lexeme=yytext(); return ASIGNACION;}

\-\> {lexeme=yytext() ;return FLECHA;}


\. {lexeme=yytext(); return PUNTO;}
\; {lexeme=yytext(); return PUNTO_COMA;}


//Operadores Logicos
\{ {lexeme=yytext(); return LLAVE_IZQ;}
\} {lexeme=yytext(); return LLAVE_DER;}
\=\= {lexeme=yytext(); return IGUALIGUAL;}
\!\= {lexeme=yytext(); return DIFERENTE;}
\> {lexeme=yytext(); return MAYOR;}
\< {lexeme=yytext(); return MENOR;}
\>\= {lexeme=yytext(); return MAYORIGUAL;}
\<\= {lexeme=yytext(); return MENORIGUAL;}
\&\& {lexeme=yytext(); return AND;}
\|\| {lexeme=yytext(); return OR;}
\! {lexeme=yytext(); return NOT;}
\!\! {lexeme=yytext(); return BOOLEQUALS;}
\? {lexeme=yytext(); return PREGUNTA;}
\: {lexeme=yytext(); return DOS_PUNTOS;}
\# {lexeme=yytext(); return NUMERAL;}
\@ {lexeme=yytext(); return ARROBA;}
\^ {lexeme=yytext(); return EXPONENTE;}
dump {lexeme=yytext(); return DUMPVAR;}

//Special Script
Kryptol {lexeme=yytext(); return KRYPTOL;}
ZephyrScript {lexeme=yytext(); return ZEPHYRSCRIPT;}
XyloCode {lexeme=yytext(); return XYLOCODE;}
Quarky {lexeme=yytext(); return QUARKY;}
SynthetiX {lexeme=yytext(); return SYNTHETIX;}
Tesseract {lexeme=yytext(); return TESSERACT;}
Nimbic {lexeme=yytext(); return NIMBIC;}
Axiomate {lexeme=yytext(); return AXIOMATE;}
JoltScript {lexeme=yytext(); return JOLTSCRIPT;}
Nexu {lexeme=yytext(); return NEXU;}
IntegroScript {lexeme=yytext(); return INTEGROSCRIPT;}
NovaLisp {lexeme=yytext(); return NOVALISP;}
ZenithCode {lexeme=yytext(); return ZENITHCODE;}
Osmosis {lexeme=yytext(); return OSMOSIS;}
Envision {lexeme=yytext(); return ENVISION;}
VelociScript {lexeme=yytext(); return VELOCISCRIPT;}
HelixLang {lexeme=yytext(); return HELIXLANG;}
FusionX {lexeme=yytext(); return FUSIONX;}
Omnicode {lexeme=yytext(); return OMNICODE;}
VortexScript {lexeme=yytext(); return VORTEXSCRIPT;}
Lumina {lexeme=yytext(); return LUMINA;}
NebulaCode {lexeme=yytext(); return NEBULACODE;}
SynapseX {lexeme=yytext(); return SYNAPSEX;}
QuartzScript {lexeme=yytext(); return QUARTZSCRIPT;}
InfernoLang {lexeme=yytext(); return INFERNO;}
SpectraScript {lexeme=yytext(); return SPECTRASCRIPT;}
FluxLang {lexeme=yytext(); return FLUXLANG;}
AurumScript {lexeme=yytext(); return AURUMSCRIPT;}
ChromaLang {lexeme=yytext(); return CHROMALANG;}
PolarisCode {lexeme=yytext(); return POLARISCODE;}
CypherX {lexeme=yytext(); return CYPHERX;}
AlgoMind {lexeme=yytext(); return ALGOMIND;}
StrataCode {lexeme=yytext(); return STRATACODE;}
QuantumLang {lexeme=yytext(); return QUANTUMLANG;}
ExoScript {lexeme=yytext(); return EXOSCRIPT;}


//Delimitadores


\( {lexeme=yytext(); return PARENTESIS_IZQ;}
\) {lexeme=yytext(); return PARENTESIS_DER;}
\[ {lexeme=yytext(); return CORCHETE_IZQ;}
\] {lexeme=yytext(); return CORCHETE_DER;}
\{ {lexeme=yytext(); return LLAVE_IZQ;}
\} {lexeme=yytext(); return LLAVE_DER;}

\: {lexeme=yytext(); return DOS_PUNTOS;}



/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return IDENTIFICADOR;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}
