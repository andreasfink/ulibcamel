//
//  UMCamel_ASN1_macros.h
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#define CONTEXT_SPECIFIC_ADD(TAG,OBJ) \
    if(OBJ) \
    { \
        OBJ.asn1_tag.tagNumber = TAG; \
        OBJ.asn1_tag.tagClass = UMASN1Class_ContextSpecific; \
        [_asn1_list addObject:OBJ]; \
    }


#define CONTEXT_SPECIFIC_ADD_NULL(TAG,OBJ) \
    if(OBJ) \
    { \
        UMASN1Null *null = [[UMASN1Null alloc]init];\
        null.asn1_tag.tagNumber = TAG; \
        null.asn1_tag.tagClass = UMASN1Class_ContextSpecific; \
        [_asn1_list addObject:null]; \
    }
#define CONTEXT_SPECIFIC_SUB_ADD(SEQ,TAG,OBJ) \
    if(OBJ) \
    { \
        OBJ.asn1_tag.tagNumber = TAG; \
        OBJ.asn1_tag.tagClass = UMASN1Class_ContextSpecific; \
        [SEQ addObject:OBJ]; \
    }


#define CONTEXT_SPECIFIC_SUB_ADD_NULL(SEQ,TAG,OBJ) \
    if(OBJ) \
    { \
        UMASN1Null *null = [[UMASN1Null alloc]init];\
        null.asn1_tag.tagNumber = TAG; \
        null.asn1_tag.tagClass = UMASN1Class_ContextSpecific; \
        [SEQ.asn1_list addObject:null]; \
    }
#define ASN1_ADD_INTEGER(LIST,i) \
    { \
        UMASN1Integer *in = [[UMASN1Integer alloc]initWithValue:i]; \
        [LIST addObject:in]; \
    }

#define ASN1_ADD_SEQUENCE(LIST,OBJ) \
    if(OBJ) \
    { \
        [LIST addObject:OBJ]; \
    }

#define GET_CONTEXT_SPECIFIC(TAG,OBJ,TYPE,o,p) \
    if((o) && (o.asn1_tag.tagNumber == TAG) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific)) \
    { \
        OBJ = [[TYPE alloc]initWithASN1Object:o context:context]; \
        o = [self getObjectAtPosition:p++]; \
    }


#define GET_CONTEXT_SPECIFIC_NOGRAB(TAG,OBJ,TYPE,o,p) \
    if((o) && (o.asn1_tag.tagNumber == TAG) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific)) \
    { \
        OBJ = [[TYPE alloc]initWithASN1Object:o context:context]; \
    }


#define GET_CONTEXT_SPECIFIC_NULL(TAG,OBJ,o,p) \
    if((o) && (o.asn1_tag.tagNumber == TAG) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific)) \
    { \
        OBJ = YES;\
        o = [self getObjectAtPosition:p++]; \
    }

#define ASN1_GET_INTEGER(i,o,p) \
    if((o) && (o.asn1_tag.tagNumber == UMASN1Primitive_integer) && (o.asn1_tag.tagClass == UMASN1Class_Universal)) \
    { \
        UMASN1Integer *io = [[UMASN1Integer alloc]initWithASN1Object:o context:context]; \
        i = io.value; \
        o = [self getObjectAtPosition:p++]; \
    }

#define ASN1_GET_SEQUENCE(seq,o,p) \
if((o) && (o.asn1_tag.tagNumber == UMASN1Primitive_sequence) && (o.asn1_tag.tagClass == UMASN1Class_Universal)) \
{ \
    seq = [[UMASN1Sequence alloc]initWithASN1Object:o context:context]; \
    o = [self getObjectAtPosition:p++]; \
}

#define DICT_ADD(DICT,OBJ,NAME)\
    if(OBJ) \
    { \
        dict[NAME] = OBJ.objectValue; \
    }

#define DICT_ADD_NULL(DICT,OBJ,NAME)\
    if(OBJ) \
    { \
        dict[NAME] = @(YES); \
    }


