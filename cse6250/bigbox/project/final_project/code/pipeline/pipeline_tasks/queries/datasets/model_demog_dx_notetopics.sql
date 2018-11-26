drop table if exists datasets.model_demog_dx_notetopics;
create table datasets.model_demog_dx_notetopics as
(
select
  model_demog_dx.hadm_id,
  model_demog_dx.hospital_expire_flag,
  model_demog_dx.is_male,
  model_demog_dx.age_at_admit,
  model_demog_dx.admission_type,
  model_demog_dx.insurance,
  model_demog_dx.language,
  model_demog_dx.marital_status,
  model_demog_dx.ethnicity,
  model_demog_dx.ccs_0,
  model_demog_dx.ccs_1,
  model_demog_dx.ccs_2,
  model_demog_dx.ccs_3,
  model_demog_dx.ccs_4,
  model_demog_dx.ccs_5,
  model_demog_dx.ccs_6,
  model_demog_dx.ccs_7,
  model_demog_dx.ccs_8,
  model_demog_dx.ccs_9,
  model_demog_dx.ccs_10,
  model_demog_dx.ccs_11,
  model_demog_dx.ccs_12,
  model_demog_dx.ccs_13,
  model_demog_dx.ccs_14,
  model_demog_dx.ccs_15,
  model_demog_dx.ccs_16,
  model_demog_dx.ccs_17,
  model_demog_dx.ccs_18,
  model_demog_dx.ccs_19,
  model_demog_dx.ccs_20,
  model_demog_dx.ccs_21,
  model_demog_dx.ccs_22,
  model_demog_dx.ccs_23,
  model_demog_dx.ccs_24,
  model_demog_dx.ccs_25,
  model_demog_dx.ccs_26,
  model_demog_dx.ccs_27,
  model_demog_dx.ccs_28,
  model_demog_dx.ccs_29,
  model_demog_dx.ccs_30,
  model_demog_dx.ccs_31,
  model_demog_dx.ccs_32,
  model_demog_dx.ccs_33,
  model_demog_dx.ccs_34,
  model_demog_dx.ccs_35,
  model_demog_dx.ccs_36,
  model_demog_dx.ccs_37,
  model_demog_dx.ccs_38,
  model_demog_dx.ccs_39,
  model_demog_dx.ccs_40,
  model_demog_dx.ccs_41,
  model_demog_dx.ccs_42,
  model_demog_dx.ccs_43,
  model_demog_dx.ccs_44,
  model_demog_dx.ccs_45,
  model_demog_dx.ccs_46,
  model_demog_dx.ccs_47,
  model_demog_dx.ccs_48,
  model_demog_dx.ccs_49,
  model_demog_dx.ccs_50,
  model_demog_dx.ccs_51,
  model_demog_dx.ccs_52,
  model_demog_dx.ccs_53,
  model_demog_dx.ccs_54,
  model_demog_dx.ccs_55,
  model_demog_dx.ccs_56,
  model_demog_dx.ccs_57,
  model_demog_dx.ccs_58,
  model_demog_dx.ccs_59,
  model_demog_dx.ccs_60,
  model_demog_dx.ccs_61,
  model_demog_dx.ccs_62,
  model_demog_dx.ccs_63,
  model_demog_dx.ccs_64,
  model_demog_dx.ccs_65,
  model_demog_dx.ccs_66,
  model_demog_dx.ccs_67,
  model_demog_dx.ccs_68,
  model_demog_dx.ccs_69,
  model_demog_dx.ccs_70,
  model_demog_dx.ccs_71,
  model_demog_dx.ccs_72,
  model_demog_dx.ccs_73,
  model_demog_dx.ccs_74,
  model_demog_dx.ccs_75,
  model_demog_dx.ccs_76,
  model_demog_dx.ccs_77,
  model_demog_dx.ccs_78,
  model_demog_dx.ccs_79,
  model_demog_dx.ccs_80,
  model_demog_dx.ccs_81,
  model_demog_dx.ccs_82,
  model_demog_dx.ccs_83,
  model_demog_dx.ccs_84,
  model_demog_dx.ccs_85,
  model_demog_dx.ccs_86,
  model_demog_dx.ccs_87,
  model_demog_dx.ccs_88,
  model_demog_dx.ccs_89,
  model_demog_dx.ccs_90,
  model_demog_dx.ccs_91,
  model_demog_dx.ccs_92,
  model_demog_dx.ccs_93,
  model_demog_dx.ccs_94,
  model_demog_dx.ccs_95,
  model_demog_dx.ccs_96,
  model_demog_dx.ccs_97,
  model_demog_dx.ccs_98,
  model_demog_dx.ccs_99,
  model_demog_dx.ccs_100,
  model_demog_dx.ccs_101,
  model_demog_dx.ccs_102,
  model_demog_dx.ccs_103,
  model_demog_dx.ccs_104,
  model_demog_dx.ccs_105,
  model_demog_dx.ccs_106,
  model_demog_dx.ccs_107,
  model_demog_dx.ccs_108,
  model_demog_dx.ccs_109,
  model_demog_dx.ccs_110,
  model_demog_dx.ccs_111,
  model_demog_dx.ccs_112,
  model_demog_dx.ccs_113,
  model_demog_dx.ccs_114,
  model_demog_dx.ccs_115,
  model_demog_dx.ccs_116,
  model_demog_dx.ccs_117,
  model_demog_dx.ccs_118,
  model_demog_dx.ccs_119,
  model_demog_dx.ccs_120,
  model_demog_dx.ccs_121,
  model_demog_dx.ccs_122,
  model_demog_dx.ccs_123,
  model_demog_dx.ccs_124,
  model_demog_dx.ccs_125,
  model_demog_dx.ccs_126,
  model_demog_dx.ccs_127,
  model_demog_dx.ccs_128,
  model_demog_dx.ccs_129,
  model_demog_dx.ccs_130,
  model_demog_dx.ccs_131,
  model_demog_dx.ccs_132,
  model_demog_dx.ccs_133,
  model_demog_dx.ccs_134,
  model_demog_dx.ccs_135,
  model_demog_dx.ccs_136,
  model_demog_dx.ccs_137,
  model_demog_dx.ccs_138,
  model_demog_dx.ccs_139,
  model_demog_dx.ccs_140,
  model_demog_dx.ccs_141,
  model_demog_dx.ccs_142,
  model_demog_dx.ccs_143,
  model_demog_dx.ccs_144,
  model_demog_dx.ccs_145,
  model_demog_dx.ccs_146,
  model_demog_dx.ccs_147,
  model_demog_dx.ccs_148,
  model_demog_dx.ccs_149,
  model_demog_dx.ccs_150,
  model_demog_dx.ccs_151,
  model_demog_dx.ccs_152,
  model_demog_dx.ccs_153,
  model_demog_dx.ccs_154,
  model_demog_dx.ccs_155,
  model_demog_dx.ccs_156,
  model_demog_dx.ccs_157,
  model_demog_dx.ccs_158,
  model_demog_dx.ccs_159,
  model_demog_dx.ccs_160,
  model_demog_dx.ccs_161,
  model_demog_dx.ccs_162,
  model_demog_dx.ccs_163,
  model_demog_dx.ccs_164,
  model_demog_dx.ccs_165,
  model_demog_dx.ccs_166,
  model_demog_dx.ccs_167,
  model_demog_dx.ccs_168,
  model_demog_dx.ccs_169,
  model_demog_dx.ccs_170,
  model_demog_dx.ccs_171,
  model_demog_dx.ccs_172,
  model_demog_dx.ccs_173,
  model_demog_dx.ccs_174,
  model_demog_dx.ccs_175,
  model_demog_dx.ccs_176,
  model_demog_dx.ccs_177,
  model_demog_dx.ccs_178,
  model_demog_dx.ccs_179,
  model_demog_dx.ccs_180,
  model_demog_dx.ccs_181,
  model_demog_dx.ccs_182,
  model_demog_dx.ccs_183,
  model_demog_dx.ccs_184,
  model_demog_dx.ccs_185,
  model_demog_dx.ccs_186,
  model_demog_dx.ccs_187,
  model_demog_dx.ccs_188,
  model_demog_dx.ccs_189,
  model_demog_dx.ccs_190,
  model_demog_dx.ccs_191,
  model_demog_dx.ccs_192,
  model_demog_dx.ccs_193,
  model_demog_dx.ccs_194,
  model_demog_dx.ccs_195,
  model_demog_dx.ccs_196,
  model_demog_dx.ccs_197,
  model_demog_dx.ccs_198,
  model_demog_dx.ccs_199,
  model_demog_dx.ccs_200,
  model_demog_dx.ccs_201,
  model_demog_dx.ccs_202,
  model_demog_dx.ccs_203,
  model_demog_dx.ccs_204,
  model_demog_dx.ccs_205,
  model_demog_dx.ccs_206,
  model_demog_dx.ccs_207,
  model_demog_dx.ccs_208,
  model_demog_dx.ccs_209,
  model_demog_dx.ccs_210,
  model_demog_dx.ccs_211,
  model_demog_dx.ccs_212,
  model_demog_dx.ccs_213,
  model_demog_dx.ccs_214,
  model_demog_dx.ccs_215,
  model_demog_dx.ccs_216,
  model_demog_dx.ccs_217,
  model_demog_dx.ccs_218,
  model_demog_dx.ccs_219,
  model_demog_dx.ccs_220,
  model_demog_dx.ccs_221,
  model_demog_dx.ccs_222,
  model_demog_dx.ccs_223,
  model_demog_dx.ccs_224,
  model_demog_dx.ccs_225,
  model_demog_dx.ccs_226,
  model_demog_dx.ccs_227,
  model_demog_dx.ccs_228,
  model_demog_dx.ccs_229,
  model_demog_dx.ccs_230,
  model_demog_dx.ccs_231,
  model_demog_dx.ccs_232,
  model_demog_dx.ccs_233,
  model_demog_dx.ccs_234,
  model_demog_dx.ccs_235,
  model_demog_dx.ccs_236,
  model_demog_dx.ccs_237,
  model_demog_dx.ccs_238,
  model_demog_dx.ccs_239,
  model_demog_dx.ccs_240,
  model_demog_dx.ccs_241,
  model_demog_dx.ccs_242,
  model_demog_dx.ccs_243,
  model_demog_dx.ccs_244,
  model_demog_dx.ccs_245,
  model_demog_dx.ccs_246,
  model_demog_dx.ccs_247,
  model_demog_dx.ccs_248,
  model_demog_dx.ccs_249,
  model_demog_dx.ccs_250,
  model_demog_dx.ccs_251,
  model_demog_dx.ccs_252,
  model_demog_dx.ccs_253,
  model_demog_dx.ccs_254,
  model_demog_dx.ccs_255,
  model_demog_dx.ccs_256,
  model_demog_dx.ccs_257,
  model_demog_dx.ccs_258,
  model_demog_dx.ccs_259,
  model_demog_dx.ccs_260,
  model_demog_dx.ccs_261,
  model_demog_dx.ccs_262,
  model_demog_dx.ccs_263,
  model_demog_dx.ccs_264,
  model_demog_dx.ccs_265,
  model_demog_dx.ccs_266,
  model_demog_dx.ccs_267,
  model_demog_dx.ccs_268,
  model_demog_dx.ccs_269,
  model_demog_dx.ccs_270,
  model_demog_dx.ccs_271,
  model_demog_dx.ccs_272,
  model_demog_dx.ccs_273,
  model_demog_dx.ccs_274,
  model_demog_dx.ccs_275,
  model_demog_dx.ccs_276,
  model_demog_dx.ccs_277,
  model_demog_dx.ccs_278,
  model_demog_dx.ccs_279,
  model_demog_dx.ccs_280,
  model_demog_dx.ccs_281,
  coalesce(ats.topic_0, 0) as topic_0,
  coalesce(ats.topic_1, 0) as topic_1,
  coalesce(ats.topic_2, 0) as topic_2,
  coalesce(ats.topic_3, 0) as topic_3,
  coalesce(ats.topic_4, 0) as topic_4,
  coalesce(ats.topic_5, 0) as topic_5,
  coalesce(ats.topic_6, 0) as topic_6,
  coalesce(ats.topic_7, 0) as topic_7,
  coalesce(ats.topic_8, 0) as topic_8,
  coalesce(ats.topic_9, 0) as topic_9
from datasets.model_demog_dx as model_demog_dx
  left join datasets.admissions_topic_scores as ats
    on model_demog_dx.hadm_id = ats.hadm_id
)
;
